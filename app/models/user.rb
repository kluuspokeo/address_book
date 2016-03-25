class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :phone_numbers, :class_name => 'PhoneNumbers'
	has_many :email_address
	has_many :address
	#clean up
	after_destroy { |record| 
		PhoneNumbers.delete(record.id)
		EmailAddress.delete(record.id)
		Address.delete(record.id)
	}
end
