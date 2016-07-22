class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all
  end
  def show
    @attendee = Attendee.find_by(id: params[:id])
    render :show
  end
end
