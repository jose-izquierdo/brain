# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    category { 'MyString' }
    datetime { '' }
    headline { 'MyString' }
    external_id { 1 }
    image { 'MyString' }
    related { 'MyString' }
    source { 'MyString' }
    summary { 'MyText' }
    url { 'MyString' }
  end
end
