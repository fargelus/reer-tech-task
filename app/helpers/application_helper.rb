# frozen_string_literal: true

module ApplicationHelper
  def short_url(shorten)
    "#{request.protocol}#{request.host_with_port}/#{shorten}"
  end

  def funny_enter_url_phrase
    phrases = [
      'One URL shortener to rule them all...',
      'Try it again if you brave enough:',
      'One bear, two bear, the game is over, another url please:',
      'Once again'
    ]
    total = phrases.size
    phrases[rand(total)]
  end
end
