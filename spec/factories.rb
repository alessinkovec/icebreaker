FactoryBot.define do

  factory :user do
    first_name { "Joe" }
    last_name { "Doe" }
    email { "joe@gmail.com" }
    password { "123456" }
    address { 'We Work Ipanema' }
    birthday { "1940-07-22" }
    gender { "1" }
    latitude { -22.9841656 }
    longitude { -43.2100433 }
  end

  factory :event do
    name { "Evento" }
    address { 'Rua Maria Quitéria, 68 Ipanema' }
    time { "19:30" }
  end
end
