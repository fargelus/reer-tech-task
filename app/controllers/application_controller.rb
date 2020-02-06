# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def from_shorten_url
    shorten = params[:shorten]
    short_url = ShortUrl.find_by(shorten: shorten)
    not_found_page unless short_url
    redirect_to short_url.url
  end

  def not_found_page
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
