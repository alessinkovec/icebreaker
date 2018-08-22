require 'open-uri'
require 'json'

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-22.9838,-43.2106&radius=500&type=bar&key=AIzaSyBzNV36HtOsZyRsMKJVnWhubJGRsUba6Bw"
   mega_hash = JSON.parse(open(url).read)
   # p mega_hash["results"]
   new_bar = mega_hash["results"].select do |bar|
     bar["name"] == "Bar Caçula Ipanema"
   end
   p new_bar[0]["photos"][0]["photo_reference"]
