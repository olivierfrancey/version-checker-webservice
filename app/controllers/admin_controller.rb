class AdminController < ApplicationController

  def index
    @admin = Admin.new
    authorize @admin

    p @admin.projects_graph
    p @admin.versions_graph
  end

  def projects
    @projects = Project.all
    #authorize @projects
  end


end
