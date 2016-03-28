class AddressController < ApplicationController
	def destroy
		render json: {
			status: Address.delete(params[:id])
		}
	end
	def create
		begin
			status = Address.new(address_params).save!
			msg = ""
		rescue Exception => e
			msg = e.message
		end
		render json: {
			status: status.to_s,
			message: msg
		}
	end
	private
	def address_params
		params.permit(:street, :state, :city, :zip_code, :user_id)
	end

end
