Rails.application.routes.draw do

  root :to => 'home#index'

  mount ShopifyApp::Engine, at: '/'

  resources :batches
  resources :home
  get '/search' => 'searches#results'

end
