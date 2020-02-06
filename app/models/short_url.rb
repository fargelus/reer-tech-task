# frozen_string_literal: true

class ShortUrl < ApplicationRecord
  validates :url, presence: true, format: URI.regexp(%w[http https])
  validates :url, uniqueness: true
end
