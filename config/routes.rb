# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'short_urls#new'

  resources :short_urls, except: %i[index destroy]
  resources :qrs, only: :create

  match '*shorten', to: 'application#from_shorten_url', via: :get
end
