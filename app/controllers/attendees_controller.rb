class AttendeesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  def index
    @attendees = Attendee.all
  end
  def show
    @attendee = Attendee.find_by(id: params[:id])
    render :show
  end
end
