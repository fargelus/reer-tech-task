# frozen_string_literal: true

class ShortenUrlService < Callable
  def initialize(url)
    @full_url = url
  end

  def call
    @full_url.chars
             .map { |_| random_chr }
             .join
  end

  private

  def random_chr
    upcased = rand(65..90).chr
    lowcased = rand(97..122).chr
    rand(2).zero? ? upcased : lowcased
  end
end
