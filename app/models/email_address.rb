class EmailAddress < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id, :email_address
  validates :email_address, presence: true ##todo: create email format validation


end
