class CreateAddressTable < ActiveRecord::Migration
  def change
    create_table :address_tables do |t|
    	t.integer :user_id, unsigned: true
    	t.text :street
    	t.text :city
    	t.text :state_code, :limit => 2
    	t.integer :zip_code, unsigned: true
    end
  end

  def down
  	drop_table :address
  end

end
