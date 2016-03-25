class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users_tables do |t|
    	t.string :first_name
      	t.string :last_name

      	t.timestamps
    end
  end

  def down
  	drop_table :users_tables
  end



end
