class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end
  def show
    @speaker = Speaker.find_by(id: params[:id])
    render :show
  end
  # def update
  #   @speaker = Speaker.find_by(id: params[:id])
  # end
end
