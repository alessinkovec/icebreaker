class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end
end
