class EmailAddress < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id, :email_address
  validates :email_address, presence: true ##todo: create email format validation

  def self.is_valid_email?
  	self.email_address =~ /[a-zA-Z0-9]+\@[a-zA-Z]+\.[a-zA-Z]{2}/
  end

end
