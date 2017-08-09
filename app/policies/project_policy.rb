class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def update?
    user.access.role == "projectAdmin"
  end

  def delete?
    user.access.role == "projectAdmin"
  end

end