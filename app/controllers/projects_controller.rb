class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    # byebug
    @user = User.find_by_id(params[:user_id])
    @project = @user.projects << Project.new
    @project = Project.new
  end
  def create
    @user = User.find_by_id(params[:user_id])
    @project = Project.create(name:params[:project][:name], description:params[:project][:description], avatar:params[:project][:avatar], user_id:params[:speaker_id], tag_list:params[:project][:tag_list] )
    # byebug
    # @project = Project.create(project_params)
    redirect_to speaker_path(current_user.id)
  end

  private

  # def project_params
  #   params.permit(:user_id, {:name, :description, :avatar})
  #   byebug
  # end
end
