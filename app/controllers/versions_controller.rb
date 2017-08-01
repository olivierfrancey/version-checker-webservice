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
  end

  # GET /versions/new
  def new
    @version = Version.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(version_params)
    @version.user = current_user
    @version.document = current_document
    @version.project = current_project
    @version.current_version = true
    @version.crypted_id = SecureRandom.hex(15)

    other_versions = Version.where(document_id: current_document.id)
    other_versions.update(:current_version => false)

    respond_to do |format|
      if @version.save
        format.html { redirect_to versions_path, notice: 'Version was successfully created.' }
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
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to versions_path, notice: 'Version was successfully updated.' }
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
    @version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_current
    other_versions = Version.where(document_id: current_document.id)
    other_versions.update(:current_version => false)

    version = Version.find(params[:id])
    version.update(:current_version => true)

    redirect_to versions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:version_number, :date, :author, :checker, :crypted_id, :current_version, :comments)
    end

    def numeric?(string)
      # `!!` converts parsed number to `true`
      !!Kernel.Float(string) 
    rescue TypeError, ArgumentError
      false
    end
end
