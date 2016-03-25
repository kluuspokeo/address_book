class EmailAddressController < ApplicationController
	def destroy
		render json: {
			:status => EmailAddress.delete(params[:id])
		}
	end
	def create
		begin
			status = EmailAddress.new(email_address_params).save!
			msg = ""
		rescue Exception => e
			msg = e.message
		end
		render json: {
			:status => status.to_s,
			:message => msg
		}
	end
	private
	def email_address_params
		params.permit(:email_address, :user_id)
	end

end
