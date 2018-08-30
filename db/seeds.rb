require 'open-uri'

puts "Destroying all garbage and you know it"

User.destroy_all
Event.destroy_all

puts "Creating all motherfuckers"

User.create!(
first_name: "Francisco",
last_name: "Braga",
address: "WeWork Ipanema",
gender: "male",
birthday: "18-3-1980",
email: "user@user.com",
password: "123456"
)

User.create!(
first_name: "Adam",
last_name: "Sinning",
address: "WeWork Ipanema",
gender: "male",
birthday: "18-4-1980",
email: "adam@sinning.com",
password: "123456"
)

User.create!(
first_name: "Aleš",
last_name: "Šinkovec",
address: "WeWork Ipanema",
gender: "male",
birthday: "18-4-1980",
email: "ales@sinkovec.com",
password: "123456"
)


# EVENT_TYPES = [
#   "'s going away drinks",
#   "'s first day",
#   "'s birthday",
#   "'s drinkathon",
#   "'s meet-a-palooza",
#   "'s last hoorah",
#   "'s huzzah",
#   "'s barbecue",
#   "'s party",
#   "'s funtime",
#   "'s showtime",
#   "'s favorite fun time",
#   "'s hooplah",
#   "'s first time"
# ]

francisco = User.find(1)
adam = User.find(2)
ales = User.find(3)

# url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{francisco.latitude},#{francisco.longitude}&radius=500&type=bar&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
# mega_hash = JSON.parse(open(url).read)
# 3.times do
#   names = ["Eloisa", "Eleonora", "Sachi", "Arthur", "Steve", "John", "Carlos", "Tom", "Michael", "Julia"]
#   random_bar = mega_hash["results"].sample
#   bar_name = random_bar["name"]
#   bar_address = random_bar["vicinity"]
#   bar_photo_ref = random_bar["photos"][0]["photo_reference"] unless random_bar["photos"].nil?
#   Event.create(
#   name: "#{names.sample}#{EVENT_TYPES.sample}",
#   place_name: "#{bar_name}",
#   address: "#{bar_address}",
#   photo_url: random_bar["photos"].nil? ? 'https://cdn.civitatis.com/estados-unidos/las-vegas/guia/bar-coyote.jpg' : "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=#{bar_photo_ref}&key=#{ENV['GOOGLE_API_SERVER_KEY']}",
#   time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, rand(19..20), [00,30].sample)
# )
# end

Event.create!(
  name: "John's last hoorah",
  address: "Ipanema, Rio de Janeiro",
  time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, rand(19..20), [00,30].sample),
  photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=CmRaAAAACmdy-tmKoVYBQhZdnFhTs6yFGPrldbWeqtlTuMaGCGfr5FSlNFSKsfj2qPv9B4sxw-JJiXsEWdomdV9QlOPuPpjkjLD1tGkIJ_ZvuL0zolWGM1HGoKMswJaJQ1lbanA9EhBjbcAa-8JMFUIEhiJNoUm8GhRZcK_Yw5rBRg_ziiWm2zjkp9kngQ&key=AIzaSyAJmoXsLZpDoVYaHxmZ0XZES8yHiC4ycO0",
  place_name: "Barraca CELBRIDADE"
  )

Event.create!(
  name: "Eleonora's party",
  address: "Av. Vieira Souto, 460 - Ipanema, Rio de Janeiro",
  time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, rand(19..20), [00,30].sample),
  photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=CmRaAAAAyWc5eX8pwnG1mBhku9UAgqhSdMti0skj2MJ8H93RYYOaz0QKJAG3mQrUQi6ToNA2WV9fv_0jEulWv1H17g1eMbiyN_TxWEcG45P7V7xubA8KnOcPXUpdnxaHIpL4BTOiEhDipWwQrDmELvdiDr_p92jpGhSKQiXxQWEMugfIs0VI7PW9QuNVMg&key=AIzaSyAJmoXsLZpDoVYaHxmZ0XZES8yHiC4ycO0",
  place_name: "23 Ocean Lounge"
  )

Event.create!(
  name: "Arthur's first day",
  address: "Rua Garcia d'Avila, 147 - Ipanema, Rio de Janeiro",
  time: DateTime.new(Date.today.year, Date.today.month, Date.today.day, rand(19..20), [00,30].sample),
  photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=450&maxheight=250&photoreference=CmRaAAAA_dgWuwR_kdSIVCn0LdxWZkdglc5QEXOIW46R3RCt_PT5IFXKlDYq1j7Ez6tlIfRMhxvHAhv9kBbbo-PirNfCtrpzPHo3SzNRuVpVxtvrCBxmn_LZrPHyd3DKf2je7FHVEhDcVcWuXpcFiXetZi5W9w0pGhTb3ELdv0_EaAlCpIHmQ9HS_9AQmw&key=AIzaSyAJmoXsLZpDoVYaHxmZ0XZES8yHiC4ycO0",
  place_name: "Venga Bar de Tapas"
  )

gender = ["male", "female"]

8.times do User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "WeWork Ipanema",
  gender: gender.sample,
  birthday: Faker::Date.birthday(18, 42),
  email: Faker::Internet.email,
  password: "123456",
  event_id: 1
  )
end

random1 = User.find(4)
random2 = User.find(5)
random1.event_id = 2
random1.save
random2.event_id = 3
random2.save

francisco.event_id = 1
francisco.save
adam.event_id = 1
adam.save

puts "Finished the motherfuckening"

