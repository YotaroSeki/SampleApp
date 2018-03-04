FactoryBot.define do
  factory :micropost do
    content { Faker::Lorem.sentence(5) }
    created_at { Time.zone.now }
    user
  end
end
