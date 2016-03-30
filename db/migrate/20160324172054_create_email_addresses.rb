class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :email_address, limit: 200
      t.references :user, index: true

      t.timestamps
    end
  end
end
