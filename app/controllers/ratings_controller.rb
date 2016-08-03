class RatingsController < ApplicationController
  before_action :set_project

  def index
    @project = Project.find_by_id(params[:project_id])
    @ratings = @project.ratings.all
  end

  def create
    @user = current_user
    @project = Project.find_by_id(params[:project_id])
    @rating = Rating.new(value: params[:project][:ratings], project: @project, user: current_user)

    if @rating.save
      current_user.ratings << @project
      redirect_to(:back)

    else
     redirect_to user_project_path(@user.id, @project.id), notice: "that didn't work"
    end

  end

  def show
    @user = User.find_by_id(params[:user_id])
    @project = Project.find_by_id(params[:project_id])
    @rating = Rating.find_by_id(params[:rating_id])
  end

  def update
   @user = User.find_by_id(params[:user_id])
   @rating = Rating.find(params[:id])
   if @rating.update_attribute :value, params[:value]
     redirect_to user_project_path(@user.id, @project.id)
   else
     render 'edit'
   end
  end

  private

  def set_project
   @project = Project.find(params[:project_id])
  end

end
