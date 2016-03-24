class PhoneNumbers < ActiveRecord::Base
  belongs_to :user
  validates :area_code, presence: true, format: { with: /\d{3}/, message: "Invalid US Area Code"} #todo: account for international area codes?
  validates :phone_number, presence: true, format: { with: /\d{7}/, message: "Invalid US Phone Number"} ##todo: account for international #s?
end
