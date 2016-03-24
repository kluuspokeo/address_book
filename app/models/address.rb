class Address < ActiveRecord::Base
  belongs_to :user
  validates :street, presence: true
  validates :zip_code, presence: true, format: { with: /\d{5}/, message: "Invalid Zip Code"} ##todo: account for geographic segment
  validates :state, presence: true, format: { with: /[a-zA-Z]{2}/, message: "Invalid State Code"} #todo: validate against a full list of state codes
end
