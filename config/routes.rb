Rails.application.routes.draw do
	resources :user do
		resources :phone_number, only: [:destroy, :create]
		resources :email_address, only: [:destroy, :create]
		resources :address, only: [:destroy, :create]
	end

end
