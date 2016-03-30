class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :area_code
      t.integer :phone_number
      t.column :label, "ENUM('none', 'home', 'work', 'mobile')", :default => 'none'
      t.references :user, index: true

      t.timestamps
    end
  end
end
