class SpeakersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @speakers = Speaker.all
  end
  def show
    @speaker = User.find_by(id: params[:id])
    @projects = @speaker.projects.all
  end
  # def update
  #   @speaker = Speaker.find_by(id: params[:id])
  # end
end
