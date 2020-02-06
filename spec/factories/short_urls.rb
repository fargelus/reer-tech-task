# frozen_string_literal: true

FactoryBot.define do
  factory :short_url do
    url { 'MyString' }
    shorten { 'MyString' }
  end
end
