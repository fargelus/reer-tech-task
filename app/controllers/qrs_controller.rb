# frozen_string_literal: true

class QrsController < ApplicationController
  def create
    qr_png = QrUrlAsPngCreator.call(params[:url])
    encoded = Base64.encode64(qr_png)
    send_data "data:image/png;base64,#{encoded}"
  end
end
