class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end
  def show

  end
end
