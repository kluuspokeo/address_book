class EmailAddress < ActiveRecord::Base
  belongs_to :user
  validates :email_address, presence: true ##todo: create email format validation


end
