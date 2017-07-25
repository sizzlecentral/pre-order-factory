Rails.application.routes.draw do

  mount ShopifyApp::Engine, at: '/'
  root :to => 'home#index'

  resources :home
  resources :batches, :except => [:show, :edit, :update]
  get '/batches/:id' => 'home#batchshow'
  patch '/batches/:id(.:format)', to: 'home#batchupdate', as: 'edit_batch'
  get '/search' => 'searches#results'

end
