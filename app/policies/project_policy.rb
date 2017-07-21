class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    user.projectAdministrator? or 
    user.superAdministrator?
  end

  def index?
    #project.projectAdministrator_id == session[:user_id] or
    #user.superAdmininistrator?
  end

  def show?
    #project.projectAdministrator_id? or
    #user.superAdmininistrator?
  end

  def update?
    user.projectAdministrator? or 
    user.superAdministrator?
  end

  def delete?
    user.projectAdministrator? or 
    user.superAdmininistrator?
  end

end