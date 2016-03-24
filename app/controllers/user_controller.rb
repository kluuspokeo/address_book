class UserController < ApplicationController
protect_from_forgery :except => :create 
	def index
		@users = User.all
	end

	def new
		@csrf_token = form_authenticity_token
	end

	def create
		begin
			new_user = User.new(user_params)
			User.transaction do
				new_user.save!

				params[:email_addresses].each { |email_address|
					new_user.email_address.create!(email_address.permit(:email_address))
				}
				params[:phone_numbers].each { |phone_number|
					new_user.phone_numbers.create!(phone_number.permit(:area_code, :phone_number))
				}
				params[:addresses].each {|address|
					new_user.address.create!(address.permit(:street, :city, :state, :zip_code))
				}
			end
		rescue Exception => e
			@error = e.message
		end
		render 'new'
	end

	def show
		@user = User.find(params[:id])
		if @user
			@addresses = Address.where(user_id: params[:id])
			@phone_numbers = PhoneNumbers.where(user_id: params[:id])
			@email_addresses = EmailAddress.where(user_id: params[:id])
		end
	end


	private
	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end



end
