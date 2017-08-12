class DocumentPolicy
  attr_reader :user, :document

  def initialize(user, document)
    @user = user
    @document = document
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
    has_projectAdmin_rights?
  end

  private

  def has_basicUser_rights?
    @user.super_admin || @document.project.accesses.exists?(user_id: @user.id)
  end

  def has_projectAdmin_rights?
    @user.super_admin || @document.project.accesses.exists?(user_id: @user.id, role: "projectAdmin")
  end

end