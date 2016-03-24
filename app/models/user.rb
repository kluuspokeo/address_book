class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :phone_numbers, :class_name => 'PhoneNumbers'
	has_many :email_address
	has_many :address

end
