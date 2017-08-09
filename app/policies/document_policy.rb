class DocumentPolicy
  attr_reader :user, :document

  def initialize(user, document)
    @user = user
    @document = document
  end

  def destroy?
    @user.accesses[0].role == "projectAdmin"
  end

end