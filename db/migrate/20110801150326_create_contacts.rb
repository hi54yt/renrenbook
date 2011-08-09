class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.string :phone
      t.string :email
      t.string :qq
      t.text :address

      t.timestamps
    end
    add_index :contacts, :user_id
  end

  def self.down
    drop_table :contacts
  end
end
