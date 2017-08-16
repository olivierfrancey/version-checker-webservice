class UserPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  def initialize(user, record)
    @user = user
    @record = record
  end

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

  def super_admin?
    if user
      user.super_admin?
    end
  end

  private

  def is_owner?
    user == record || user.super_admin?
  end
end

