require 'open-uri'

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
  end

  def new
    @chat = Chat.new
  end

  def show
    # @chats = Chat.all
    @chat = Chat.new
    @chats = Chat.where(event_id: params[:id])
    @event = Event.find_by(id: params[:id])
    current_user.event_id = @event.id
    current_user.save
    parse
    @bar_names = []
    @mega_hash["results"].each do |bar|
      @bar_names << bar["name"]
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    parse
    new_bar = @mega_hash["results"].select do |bar|
      bar["name"] == @event.place_name
    end
    bar_photo_ref = new_bar[0]['photos'][0]['photo_reference']
    @event.photo_url = new_bar[0]['photos'].nil? ? 'https://cdn.civitatis.com/estados-unidos/las-vegas/guia/bar-coyote.jpg' : "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=#{bar_photo_ref}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    @event.address = new_bar[0]['vicinity']

    @event.update(event_params)

    respond_to do |format|
    format.html { render 'events/show'}
    format.js
    end
  end

  def parse
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{current_user.latitude},#{current_user.longitude}&radius=500&type=bar&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    @mega_hash = JSON.parse(open(url).read)
  end

  def create
    parse
    random_bar = @mega_hash["results"].sample

    bar_name = random_bar["name"]
    bar_address = random_bar["vicinity"]
    bar_photo_ref = random_bar["photos"][0]["photo_reference"] unless random_bar["photos"].nil?
    @event = Event.create(
      name: "#{current_user.first_name}#{EVENT_TYPES.sample}",
      place_name: "#{bar_name}",
      address: "#{bar_address}",
      photo_url: random_bar["photos"].nil? ? 'https://cdn.civitatis.com/estados-unidos/las-vegas/guia/bar-coyote.jpg' : "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=#{bar_photo_ref}&key=#{ENV['GOOGLE_API_SERVER_KEY']}",
      time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, rand(19..20), [00,30].sample)
    )
    current_user.event_id = @event.id
    current_user.save
    redirect_to event_path(@event)
    # @chat = Chat.new
    # @chat.username = current_user.first_name
    # @chat.message = "blabal"
    # @chat.event_id = @event.id
    # @chat.save
    # respond_to do |format|
    # if @chat.save
    #   format.html { redirect_to @event, notice: 'Message was successfully posted.' }
    #   format.json { render :show, status: :created, location: @event }
    # else
    #   format.html { render :new }
    #   format.json { render json: @chat.errors, status: :unprocessable_entity }
    # end

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

  private

  def chat_params
    params.require(:chat).permit(:username, :message, :event_id)
  end

  def event_params
    params.require(:event).permit(:name, :time, :place_name, :address, :photo_url)
  end
end
