FactoryBot.define do
  factory :event do
    title {'Test'}
    description {'This is test'}
    start_date {Date.today}
    end_date {Date.today}
    location {'Thimphu'}
    capacity {12}
  end
end