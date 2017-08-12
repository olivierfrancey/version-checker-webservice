class UserPolicy < ApplicationPolicy

  def edit?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def stats?
    is_owner?
  end

  private

  def is_owner?
    user == record
  end
end

