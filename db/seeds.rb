puts "Destroying all garbage and you know it"

User.destroy_all
Event.destroy_all

puts "Creating all motherfuckers"


gender = ["male", "female"]
address_people = [
  "WeWork Ipanema, Visconde de Piraja 495, Rio",
  "Rua Canning 22, Ipanema"
]

20.times do User.create!(
  first_name: Faker::Name.first_name
  last_name: Faker::Name.last_name
  address: address_people.sample
  gender: gender.sample
  birthday: Faker::Date.birthday(18, 42)
  email: Faker::Internet.email
  password: "123456"
  )
end

address_places = [
  "Blue Agave, Ipanema",
  "Sabugosa, Ipanema",
  "Polis Sucos, Ipanema",
  "Centaurus, Ipanema",
  "Azumi, Copacabana",
  "Siqueiro Campos Metro, Copacabana"
]

4.times do Event.create!(
  name: Faker::StrangerThings.quote
  address: adress_places.sample
  time: Faker::Time.between(DateTime.now, Date.today, :evening)
  user_id: rand(1..20)
  )
end


puts "Finished the motherfuckening"




# Users
# first name
# last name
# address
# gender
# email
# password


# Events
# name
# address
# time
# status
# user_id
