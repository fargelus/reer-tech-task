# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
    it { should allow_value('https://www.youtube.com/').for(:url) }
    it { should_not allow_value('test').for(:url) }
  end
end
