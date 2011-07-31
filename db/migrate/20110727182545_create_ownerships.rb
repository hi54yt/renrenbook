class CreateOwnerships < ActiveRecord::Migration
  def self.up
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :book_id
      t.float :price
      t.integer :howold
      t.text :comment

      t.timestamps
    end
    add_index :ownerships, :user_id
    add_index :ownerships, :book_id
  end

  def self.down
    drop_table :ownerships
  end
end
