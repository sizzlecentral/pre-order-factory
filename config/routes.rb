Rails.application.routes.draw do

	mount ShopifyApp::Engine, at: '/'
	root :to => 'home#index'

	resources :home
	resources :batches, :except => [:show, :edit, :update, :create]

	get '/batches/:id' => 'home#batchshow'
	get '/batches/:id/edit(.:format)', to: 'home#batchedit', as: 'edit_batch'
	patch '/batches/:id/(.:format)', to: 'home#batchupdate'
	get '/batches/product/:id' => 'batches#show'
	get '/search' => 'searches#results'
	post '/batches(.:format)', to: 'home#batchcreate'
	get '/batches/:id/order_mailer(.:format)', to: 'home#ordermailer', as: 'order_mailer'
	post '/batches/:id/order_mailer' => 'home#sendemail'

end
