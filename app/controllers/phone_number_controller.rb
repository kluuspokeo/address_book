class PhoneNumberController < ApplicationController
	def destroy
		render json: {
			status: PhoneNumbers.delete(params[:id])
		}
	end
	def create
		begin
			status = PhoneNumbers.new(phone_number_params).save!
			msg = ""
		rescue Exception => e
			msg = e.message
		end
		render json: {
			status: status.to_s,
			message: msg
		}
	end

	def by_label
		@numbers = PhoneNumbers.by_label params[:label]
		render 'by_label'
	end


	private
	def phone_number_params
		params.permit(:area_code, :phone_number, :label, :user_id)
	end


end
