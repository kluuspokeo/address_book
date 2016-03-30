Rails.application.routes.draw do
	resources :users do
		resources :phone_numbers, only: [:destroy, :create]
		resources :email_addresses, only: [:destroy, :create]
		resources :addresses, only: [:destroy, :create]

	end
	get '/phone_number/:label', to: 'phone_number#by_label', as: 'get_by_phone_type'
end
