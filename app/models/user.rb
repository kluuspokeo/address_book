class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :phone_numbers, :class_name => 'PhoneNumbers'
	has_many :email_address
	has_many :address
	#clean up
	after_destroy { |record| 
		PhoneNumbers.delete(user_id: record.id)
		EmailAddress.delete(user_id: record.id)
		Address.delete(user_id: record.id)
	}
end
