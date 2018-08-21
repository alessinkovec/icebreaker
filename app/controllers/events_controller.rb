class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
    #@markers = @event{ lat: event.latitude, lng: event.longitude }
  end

  def create
    @event = Event.create(
      name: "#{current_user.first_name}#{EVENT_TYPES.sample}",
      address: PLACES.sample,
      time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, 19, 30),
    )
    redirect_to @event
  end

  EVENT_TYPES = [
    "'s going away drinks",
    "'s first day",
    "'s first gangbang",
    "'s gonna skull fuck you",
    "'s gonna get it onnnn",
    "'s birthday",
    "'s gonna get his pussy waxed",
    "'s lapdance",
    "'s last hoorah",
    "'s huzzah"
  ]

  PLACES = [
    "Blue Agave, Ipanema",
    "Sabugosa, Ipanema",
    "Polis Sucos, Ipanema",
    "Centaurus, Ipanema",
    "Azumi, Copacabana",
    "Siqueiro Campos Metro, Copacabana"
  ]
end
