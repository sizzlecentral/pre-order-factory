Rails.application.routes.draw do

  mount ShopifyApp::Engine, at: '/'
  root :to => 'home#index'

  resources :home
  resources :batches, :except => [:show, :edit]

  get '/batches/:id' => 'home#batchshow'
  get '/batches/:id/edit(.:format)', to: 'home#batchedit', as: 'edit_batch'
  patch '/batches/:id/(.:format)', to: 'home#batchupdate'
  get '/search' => 'searches#results'

end
