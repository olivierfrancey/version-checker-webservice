class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :clear_current_project, only: [:index]
  before_action :check_logged_in
  
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
        format.html { redirect_to projects_path, notice: t('project.new.success') }
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
    
    respond_to do |format|
      if authorize @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
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
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
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
