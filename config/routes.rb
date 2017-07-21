Rails.application.routes.draw do

  root :to => 'home#index'
  
  mount ShopifyApp::Engine, at: '/'
  
  resources :batches
  get '/search' => 'searches#results'

end
