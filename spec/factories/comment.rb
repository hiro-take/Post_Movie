FactoryBot.define do
  factory :comment do
    text {"test"}
    user
    movie
  end
end