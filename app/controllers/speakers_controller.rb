class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end
  def show
    @speaker = User.find_by(id: params[:id])
    @projects = @speaker.projects.all
    render :show
  end
  # def update
  #   @speaker = Speaker.find_by(id: params[:id])
  # end
end
