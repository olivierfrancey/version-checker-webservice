class DocumentPolicy
  attr_reader :user, :document

  def initialize(user)
    @user = user
  end

  # def create?
  # end

  # def read?
  # end

  # def update?
  # end

  def delete?
    user.projectAdministrator? or 
    user.superAdministrator?
  end

end