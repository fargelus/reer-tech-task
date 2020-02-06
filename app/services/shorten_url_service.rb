# frozen_string_literal: true

require 'uri'

class ShortenUrlService < Callable
  SHIFT_VAL = 5

  def initialize(url)
    @pathname = URI.parse(url).path
  end

  def call
    ascii = @pathname.chars.map(&:ord)
    ascii.map { |c| c + SHIFT_VAL }
         .map(&:chr).join
  end
end
