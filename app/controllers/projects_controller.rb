class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :clear_current_project, only: [:index]
  before_action :check_logged_in

  require 'zip'
  
  # GET /projects
  # GET /projects.json
  def index
    if current_user.super_admin?
      @projects= Project.all
    else
      @projects = Project.where(id: session[:projects]).order(:identifier)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @accesses = Access.where(project_id: session[:current_project_id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    # create default access as project admin
    access = Access.new()
    access.user = current_user
    access.project = @project
    access.role = "projectAdmin"

    respond_to do |format|
      if @project.save && access.save       
        format.html { redirect_to projects_path, notice: t('project.create.confirmation') }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: t('project.update.confirmation') }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: t('project.destroy.confirmation') }
      format.json { head :no_content }
    end
  end

  def move_to_document
    session[:current_project_id] = params[:id]
    redirect_to documents_path
  end

  def move_to_access
    session[:current_project_id] = params[:id]
    redirect_to accesses_path
  end

  def move_to_detail
    session[:current_project_id] = params[:id]
    redirect_to project_path(params[:id])
  end

  def all_download
    files = Version.where(project_id: params[:id], current_version: true)
    p files

    zipfile_name = "#{Rails.root}/public/downloads/version-checker-#{Time.now.strftime("%Y%d%m-%H%M%S")}.zip"

    ::Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      files_list = "\n"
      files.each do |file|
        files_list += "* "+file.pdf_file_name+"\n"
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
        zipfile.add(file.pdf_file_name, CGI::unescape("#{Rails.root}/public#{file.pdf_file.to_s}"))
      end
      zipfile.get_output_stream("version checker") { |os| os.write "YOUR DOWNLOAD at #{Time.now}\n\nThis download contents the following files: #{files_list}\nThank you for using version-checker" }
    end

    send_file CGI::unescape(zipfile_name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def clear_current_project
      session[:current_project_id] = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :identifier, :address, :npa, :city, :country, :bill_option, :client_name, :client_address, :client_npa, :client_city, :client_country)
    end
end
