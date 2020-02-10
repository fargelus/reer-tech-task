# frozen_string_literal: true

require 'rqrcode'

class QrUrlCreator < Callable
  def initialize(url)
    @url = url
    @png_options = {
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    }
  end

  def call
    qrcode = RQRCode::QRCode.new(@url)
    qrcode.as_png(@png_options).to_s
  end
end
