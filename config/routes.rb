Rails.application.routes.draw do
	resources :user
	resources :phone_number ##todo: exclude unused endpoints
	resources :email_address
	resources :address
end
