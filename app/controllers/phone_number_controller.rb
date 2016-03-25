class PhoneNumberController < ApplicationController
	def destroy
		render json:{
			:status => true
		}
		# render json: {
		# 	:status => PhoneNumbers.delete(params[:id])
		# }
	end
end
