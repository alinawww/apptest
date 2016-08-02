class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    # @user = User.find_by_id(params[:user_id])
    # byebug
    # @project = Project.find_by_id(params[:id])
    # # @rating = @project.ratings.new
    # @ratings = @project.ratings.all
    # @average = @project.ratings.average(:value)
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
    if @ratings.length > 0
        @average = @project.ratings.average(:value).floor
    end
  end

  def favorite
    @project = Project.find_by(id: params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @project
      redirect_to(:back)

    elsif type == "unfavorite"
      current_user.favorites.delete(@project)
      redirect_to(:back)

    else
      # Type missing, nothing happens
      # redirect_to :back, notice: 'Nothing happened.'
    end
  end

  # private

  # def project_params
  #   params.permit(:user_id, {:name, :description, :avatar})
  #   byebug
  # end
end
