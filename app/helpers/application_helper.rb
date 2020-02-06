# frozen_string_literal: true

module ApplicationHelper
  def short_url(shorten)
    "#{request.protocol}#{request.host_with_port}/#{shorten}"
  end
end
