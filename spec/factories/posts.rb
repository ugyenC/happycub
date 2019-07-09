FactoryBot.define do
  factory :post do
    title {'Tests'}
    body {'This is test'}
    user
  end
end