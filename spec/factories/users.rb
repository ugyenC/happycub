FactoryBot.define do
  factory :user do
    sequence(:email){ Faker::Internet.email}
    password 'Selise88'
    password_confirmation 'Selise88'
    admin true
    confirmed_at Date.today

  end
end