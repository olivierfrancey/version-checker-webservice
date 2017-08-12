class VersionsController < ApplicationController
  before_action :set_version, only: [:show, :edit, :update, :destroy]
  before_action :check_logged_in
  
  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.where(document_id: session[:current_document_id]).order(:version_number).reverse_order
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
    authorize @version
  end

  # GET /versions/new
  def new
    @version = Version.new
    @version.document = current_document
    authorize @version
  end

  # GET /versions/1/edit
  def edit
    authorize @version
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(version_params)
    @version.user = current_user
    @version.document = current_document
    @version.project = current_project
    @version.current_version = true

    authorize @version

    @version.encrypted_id = BCrypt::Password.create("#{current_project.id}#{current_document.id}#{@version.version_number}")
    File.open(generate_qrcode(@version.encrypted_id)) do |f|
      @version.qrcode = f
    end

    other_versions = Version.where(document_id: current_document.id)
    if other_versions.any?
      p other_versions
      other_versions.update(current_version: false)
    else
      p 'no other version'
    end

    document = Document.find(current_document.id)
    document.update(last_version: @version.version_number, last_version_date: @version.date)

    respond_to do |format|
      if @version.save
        p "save version"

        insert_qrcode_in_pdf @version.file, @version.qrcode, @version.document.qr_code_position.page, @version.document.qr_code_position.x, @version.document.qr_code_position.y, @version.document.qr_code_position.size

        format.html { redirect_to versions_path, notice: t('version.create.confirmation') }
        format.json { render :show, status: :created, location: @version }
      else
        format.html { render :new }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    authorize @version
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to versions_path, notice: t('version.update.confirmation') }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    authorize @version
    @version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: t('version.destroy.confirmation') }
      format.json { head :no_content }
    end
  end



  
  def make_current
    other_versions = Version.where(document_id: session[:current_document_id])
    authorize other_versions.update(current_version: false)

    version = Version.find(params[:id])
    version.update(current_version: true)

    document = Document.find(session[:current_document_id])
    document.update(last_version: version.version_number, last_version_date: version.date)
    p document
    
    redirect_to versions_path
  end

  def download
    path = params[:file_name].to_s.sub! "raw", "stamped"
    send_file CGI::unescape("#{Rails.root}/public#{path}")
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:version_number, :date, :author, :checker, :crypted_id, :file, :current_version, :comments)
    end

    def numeric?(string)
      # `!!` converts parsed number to `true`
      !!Kernel.Float(string) 
    rescue TypeError, ArgumentError
      false
    end

    def generate_qrcode(string)
      qrcode = RQRCode::QRCode.new(string)
      png = qrcode.as_png(
            resize_gte_to: false,
            resize_exactly_to: false,
            fill: 'white',
            color: 'black',
            size: 120,
            border_modules: 4,
            module_px_size: 6,
            file: nil # path to write
            )
      qrcode_path = "#{Rails.root}/tmp/qrcode#{CGI::escape(string)}.png"
      p qrcode_path
      File.open(qrcode_path, 'wb') {|f| f.write qrcode.as_png(
            resize_gte_to: false,
            resize_exactly_to: false,
            fill: 'white',
            color: 'black',
            size: 200,
            border_modules: 1,
            module_px_size: 6,
            file: nil # path to write
          )}
      return qrcode_path
    end

    def insert_qrcode_in_pdf(pdf_path, qrcode_path, page, x, y, size)
      require "prawn"
      require "prawn/measurement_extensions"

      new_pdf_path = pdf_path.to_s.sub! 'raw', 'stamped'
      p pdf_path
      p new_pdf_path

      dir = File.dirname(CGI::unescape("#{Rails.root}/public#{new_pdf_path}"))
      FileUtils.mkdir_p(dir) unless File.directory?(dir)

      # generate temporary pdf with the qrcode
      info = {
        :Producer     => 'version-checker',
        :CreationDate => Time.now
      }

      qrcode_pdf = Prawn::Document.new(
        :info => info,
        :margin => 0)
      qrcode_pdf.image CGI::unescape("#{Rails.root}/public#{qrcode_path}"), :at => [x.mm, y.mm], :width => size.mm
      #qrcode_pdf.draw_text "version-checker.com", :at => [x.mm, (y-size).mm]      

      # combine pdf's and save
      pdf = CombinePDF.load CGI::unescape("#{Rails.root}/public#{pdf_path}") # based pdf
      pdf.pages[page-1] << CombinePDF.parse(qrcode_pdf.render).pages[0]
      pdf.save CGI::unescape("#{Rails.root}/public#{new_pdf_path}")

    end
end
