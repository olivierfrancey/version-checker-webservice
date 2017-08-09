class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  before_action :set_roles, only: [:new, :create, :edit]
  before_action :check_logged_in

  # GET /accesses
  # GET /accesses.json
  def index
    @accesses = Access.where(project_id: session[:current_project_id]).order(:role).reverse_order
  end

  # GET /accesses/1
  # GET /accesses/1.json
  def show
  end

  # GET /accesses/new
  def new
    @access = Access.new
  end

  # GET /accesses/1/edit
  def edit
  end

  # POST /accesses
  # POST /accesses.json
  def create
    @access = Access.new(access_params)
    authorize @access
    @access.project = current_project
    p current_project
    
    if user = User.find_by(email: @access.email)
      p "user exists"
      @access.user = user
      p @access
      respond_to do |format|
        if @access.save
          p "access created"
          format.html { redirect_to accesses_path, notice: 'Access was successfully created.' }
          format.json { render :show, status: :created, location: @access }
        else
          format.html { render :new }
          format.json { render json: @access.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
      # TODO
      # send invitiation email
        format.html { redirect_to projects_path, notice: 'Access failed.' }
      end
    end
  end

  # PATCH/PUT /accesses/1
  # PATCH/PUT /accesses/1.json
  def update
    authorize @access
    respond_to do |format|
      if @access.update(access_params)
        format.html { redirect_to accesses_path, notice: 'Access was successfully updated.' }
        format.json { render :show, status: :ok, location: @access }
      else
        format.html { render :edit }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesses/1
  # DELETE /accesses/1.json
  def destroy
    authorize @access
    @access.destroy
    respond_to do |format|
      format.html { redirect_to accesses_url, notice: 'Access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access
      @access = Access.find(params[:id])
    end

    def set_roles
      @roles = [
        [t('access.role.basicUser'), 'basicUser'],
        [t('access.role.projectAdmin'), 'projectAdmin']
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_params
      params.require(:access).permit(:role, :user_id, :project_id, :email)
    end
end
