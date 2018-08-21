require 'open-uri'

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @markers = @event{ lat: event.latitude, lng: event.longitude }
  end

  def create
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{current_user.latitude},#{current_user.longitude}&radius=500&type=bar&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    mega_hash = JSON.parse(open(url).read)
    random_bar = mega_hash["results"].sample
    bar_name = random_bar["name"]
    bar_address = random_bar["vicinity"]
    bar_photo_ref = random_bar["photos"][0]["photo_reference"] unless random_bar["photos"].nil?

    @event = Event.create(
      name: "#{current_user.first_name}#{EVENT_TYPES.sample}",
      address: "#{bar_name}",
      photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=#{bar_photo_ref}&key=#{ENV['GOOGLE_API_SERVER_KEY']}",
      time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, 19, 30)
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
