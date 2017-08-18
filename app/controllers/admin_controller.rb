class AdminController < ApplicationController
  before_action :get_data

  def index
    @admin = Admin.new
    authorize @admin
    @projects_quantity  = @admin.projects_quantity(@data)
    @documents_quantity = @admin.documents_quantity(@data)
    @versions_quantity  = @admin.versions_quantity(@data)
    @users_quantity     = @admin.users_quantity(@data)

  end

  def projects
    @projects = Project.all
    #authorize @projects
  end

  def users
    @users = User.all.order(:last_name, :first_name)
  end

  def logs
    @logs = Audits.all.order(:created_at).reverse
  end

  private

  def get_data
    @data = Audits.where("created_at > ?", 1.month.ago).as_json
  end

end
