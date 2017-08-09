class AccessPolicy
  attr_reader :user, :access

  def initialize(user, access)
    @user = user
    @access = access
  end

  def create?
    @user.accesses[0].role == "projectAdmin"
  end

  def update?
    @user.accesses[0].role == "projectAdmin"
  end

  def destroy?
    @user.accesses[0].role == "projectAdmin"
  end

end