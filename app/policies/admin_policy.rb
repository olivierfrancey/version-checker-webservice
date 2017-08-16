class AdminPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.super_admin
  end

  def projects?
    @user.super_admin
  end

end