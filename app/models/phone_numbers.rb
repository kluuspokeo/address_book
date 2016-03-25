class PhoneNumbers < ActiveRecord::Base
  belongs_to :user
  validates :area_code, format: { with: /\d{3}/} #todo: account for international area codes?
  validates :phone_number, format: { with: /\d{7}/} ##todo: account for international #s?
end
