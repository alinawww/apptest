class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    # byebug
    @user = User.find_by(id: params[:user_id])
    # byebug
    # @id = params[:user_id]
    @project = Project.new
  end
  def create
    @user = User.find_by_id(params[:user_id])
    @project = Project.create(name:params[:project][:name], description:params[:project][:description], avatar:params[:project][:avatar], user_id:params[:user_id], tag_list:params[:project][:tag_list] )
    if @project.save
      redirect_to speaker_path(current_user.id)
    else
      # render 'error'
    end
  end

  # private

  # def project_params
  #   params.permit(:user_id, {:name, :description, :avatar})
  #   byebug
  # end
end
