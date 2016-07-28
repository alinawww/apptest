class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @user = User.find_by(id: params[:user_id])
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

  def edit
    @user = User.find_by_id(params[:user_id])
    @project = Project.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @project = Project.find_by_id(params[:id])
    # @ratings = @project.ratings.all
    if @project.update_attributes(name:params[:project][:name], description:params[:project][:description], avatar:params[:project][:avatar], user_id:params[:user_id], tag_list:params[:project][:tag_list] )
      redirect_to user_project_path(@user.id, @project.id)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @project = Project.find_by_id(params[:id])
    @rating = @project.ratings.new
    @ratings = @project.ratings.all
    sum = 0
    @ratings.each{|rating|
      sum += rating.value
    }
    @average = sum / @ratings.length
  end

  # private

  # def project_params
  #   params.permit(:user_id, {:name, :description, :avatar})
  #   byebug
  # end
end
