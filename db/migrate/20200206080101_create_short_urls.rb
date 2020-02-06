# frozen_string_literal: true

class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :shorten

      t.timestamps
    end
  end
end
