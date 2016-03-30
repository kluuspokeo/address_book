class Address < ActiveRecord::Base
  belongs_to :user
  validates :street, presence: true
  validates :zip_code, format: { with: /\d{5}/} ##todo: account for geographic segment
  validates :city, format: { with: /\w+/} 
  validates :state, format: { with: /[a-zA-Z]{2}/} #todo: validate against a full list of state codes
end
