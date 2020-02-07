# frozen_string_literal: true

class ShortUrlsController < ApplicationController
  before_action :get_empty_short_url, only: %i[new show]

  def new; end

  def create
    url = params[:short_url][:url]
    existing_url = ShortUrl.find_by(url: url)
    if existing_url
      redirect_to short_url_path(existing_url.id)
    else
      create_from_url(url)
    end
  end

  def show
    exist_url = ShortUrl.find_by(id: params[:id])
    if exist_url
      @shorten = exist_url.shorten
    else
      redirect_to root_path
    end
  end

  private

  def get_empty_short_url
    @short_url = ShortUrl.new
  end

  def create_from_url(url)
    short_url = ShortenUrlService.call(url)
    @short_url = ShortUrl.new(url: url, shorten: short_url)
    if @short_url.save
      redirect_to short_url_path(@short_url.id)
    else
      render 'new'
    end
  end
end
