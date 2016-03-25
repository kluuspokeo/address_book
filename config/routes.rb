Rails.application.routes.draw do
	resources :user do
		resources :phone_number, only: [:destroy, :create]
		resources :email_address, only: [:destroy, :create]
		resources :address, only: [:destroy, :create]

	end
	get '/phone_number/:label', to: 'phone_number#by_label', as: 'get_by_phone_type'
end
