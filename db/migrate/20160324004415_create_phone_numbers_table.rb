class CreatePhoneNumbersTable < ActiveRecord::Migration
  def up
    create_table :phone_numbers_tables do |t|
    	t.integer :user_id, unsigned: true, :null => :no
    	t.integer :country_code, unsigned: true
    	t.integer :phone_number, unsigned: true
    	t.column :label, "ENUM('none', 'home', 'work', 'mobile')"

    	t.timestamps
    end
    add_index :phone_numbers_tables, [:user_id]
  end

  def down
  	drop_table :phone_numbers_tables
  end
  

end
