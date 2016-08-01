class AgendaController < ApplicationController
  def index
    @users = User.all
    @projects = Project.all
    @project = Project.find_by(id: params[:id])
  end
end
