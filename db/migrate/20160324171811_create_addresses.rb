class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state, limit: 2
      t.integer :zip_code
      t.references :user, index: true

      t.timestamps
    end
  end
end
