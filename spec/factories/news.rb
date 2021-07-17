# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    category { Faker::Space.moon }
    publish_date { Time.at(1596589501) }
    headline { Faker::Lorem.sentence }
    external_id { rand 7..500 }
    image { Faker::Space.star }
    related { Faker::Space.planet }
    source { Faker::Space.agency }
    summary { Faker::Lorem.paragraph }
    url { "https://www.#{SecureRandom.hex(7)}.com" }
  end
end
