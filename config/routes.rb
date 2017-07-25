Rails.application.routes.draw do

  mount ShopifyApp::Engine, at: '/'
  root :to => 'home#index'

  resources :home
  resources :batches, except: :show
  get '/batches/:id' => 'home#batchshow'
  get '/search' => 'searches#results'

end
