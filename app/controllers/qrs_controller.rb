# frozen_string_literal: true

class QrsController < ApplicationController
  def create
    send_data QrUrlCreator.call(params[:url])
  end
end
