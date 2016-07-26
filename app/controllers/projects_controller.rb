class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @speaker = User.find_by_id(params[:speaker_id])
    @project = Project.new
    @project.save
  end
  def create
    @speaker = User.find_by_id(params[:speaker_id])
    @project = Project.create(name:params[:project][:name], description:params[:project][:description], avatar:params[:project][:avatar], speaker_id:params[:speaker_id] )
    byebug
    redirect_to speaker_path(current_user.id)
  end

  # private

  def project_params
    byebug
    params.require(:project).permit(:name, :description, :avatar)
    # byebug
  end
end
