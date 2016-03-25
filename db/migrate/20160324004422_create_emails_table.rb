class CreateEmailsTable < ActiveRecord::Migration
  def up
    create_table :emails_tables do |t|
    	t.integer :user_id, unsigned: true
    	t.text :email

    	t.timestamps
    end
    add_index :emails_tables, [:user_id]
  end

  def down
  	drop_table :emails_tables
  end

end
