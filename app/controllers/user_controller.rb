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
				if !params[:email_address].blank?
					params[:email_addresses].each { |email_address|
						new_user.email_address.create!(email_address.permit(:email_address))
					}
				end
				if !params[:phone_numbers].blank?
					params[:phone_numbers].each { |phone_number|
						new_user.phone_numbers.create!(phone_number.permit(:area_code, :phone_number))
					}
				end
				if !params[:addresses].blank?
					params[:addresses].each {|address|
						new_user.address.create!(address.permit(:street, :city, :state, :zip_code))
					}
				end
			end
		rescue Exception => e
			@error = e.message
			render 'new'
			return
		end
		redirect_to new_user
	end

	def edit
		show
		render 'edit'
	end



	def show
		@user = User.where(params.permit(:id)).includes(:addresses, :phone_numbers, :email_addresses).first
		redirect_to user_index_url if !@user
	end

	def destroy
		User.delete(params[:id])
		redirect_to user_index_url
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end



end
