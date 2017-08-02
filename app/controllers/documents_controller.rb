class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  #before_action :set_group, only: [:new, :create]
  before_action :check_logged_in
  
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.where(project_id: session[:current_project_id]).order(:identifier)
    @project = current_project
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.project = current_project

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    p document_params
    p @document
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to documents_path, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move_to_version
    session[:current_document_id] = params[:id]
    if params[:new] == 'true'
      redirect_to new_version_path
    else
      redirect_to versions_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # def set_group
    #   @groups = Group.where(project_id: session[:current_project_id]).pluck(:name, :id)
    #   #@groups = ['Default']
    #   p @groups
    #   if !@groups.any?
    #     p "Is empty!"
    #     @groups = Group.new
    #     @groups.user = current_user
    #     @groups.project = current_project
    #     @groups.name = "Default"

    #     @groups.save
    #   end
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:identifier, :title, :sub_title, :doc_type, :size, :group, :last_version, :last_version_date)
    end
end
