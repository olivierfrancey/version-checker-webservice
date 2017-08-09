class DocumentPolicy
  attr_reader :user, :document

  def initialize(user, document)
    @user = user
    @document = document
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