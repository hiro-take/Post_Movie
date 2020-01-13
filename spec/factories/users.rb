FactoryBot.define do

  factory :user do
    nickname              {"hiro"}
    sequence(:email) {Faker::Internet.email}
    password              {"aaaa1995"}
    password_confirmation {"aaaa1995"}
  
  end

end