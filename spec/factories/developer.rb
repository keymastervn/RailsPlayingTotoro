FactoryBot.define do
  factory :developer do
    email { Faker::Internet.unique.email }
  end
end