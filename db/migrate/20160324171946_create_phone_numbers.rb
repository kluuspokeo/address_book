class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :country_code
      t.integer :phone_number
      t.integer :label
      t.references :user, index: true

      t.timestamps
    end
  end
end
