puts "Destroying all garbage and you know it"

User.destroy_all
Event.destroy_all

puts "Creating all motherfuckers"

# 20.times do User.create!(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   address: address_people.sample,
#   gender: gender.sample,
#   birthday: Faker::Date.birthday(18, 42),
#   email: Faker::Internet.email,
#   password: "123456",
#   event_id: rand(1..4)
#   )
# end

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



# address_places = [
#   "Blue Agave, Ipanema",
#   "Sabugosa, Ipanema",
#   "Polis Sucos, Ipanema",
#   "Centaurus, Ipanema",
#   "Azumi, Copacabana",
#   "Siqueiro Campos Metro, Copacabana"
# ]

# 4.times do Event.create!(
#   name: Faker::StrangerThings.quote,
#   address: address_places.sample,
#   time: Faker::Time.between(DateTime.now, Date.today, :evening),
#   )
# end

# gender = ["male", "female"]
# address_people = [
#   "WeWork Ipanema, Visconde de Piraja 495, Rio",
#   "Rua Canning 22, Ipanema"
# ]



puts "Finished the motherfuckening"

