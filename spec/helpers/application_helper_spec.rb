# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.short_url' do
    it 'returns valid http url' do
      shorten = 'test'
      expect(helper.short_url(shorten)).to include(shorten)
    end
  end
end
