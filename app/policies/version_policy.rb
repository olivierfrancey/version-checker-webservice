class VersionPolicy
  attr_reader :user, :version

  def initialize(user, version)
    @user = user
    @version = version
  end

  def new?
    has_basicUser_rights?
  end

  def create?
    has_basicUser_rights?
  end

  def show?
    has_basicUser_rights?
  end

  def edit?
    has_basicUser_rights?
  end

  def update?
    has_basicUser_rights?
  end

  def destroy?
    has_basicUser_rights?
  end

  def make_current?
    has_basicUser_rights?
  end

  private

  def has_basicUser_rights?
    @user.super_admin || @version.document.project.accesses.exists?(user_id: @user.id)
  end

end