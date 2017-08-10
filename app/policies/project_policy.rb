class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def update?
    @user.super_admin || (@user.accesses[0].role == "projectAdmin")
  end

  def destroy?
    @user.super_admin || (@user.accesses[0].role == "projectAdmin")
  end

  def accesses?
    @user.super_admin || (@user.accesses[0].role == "projectAdmin")
  end

end