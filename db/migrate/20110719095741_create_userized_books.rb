class CreateUserizedBooks < ActiveRecord::Migration
  def self.up
    create_table :userized_books do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end

	add_index :userized_books,:book_id
	add_index :userized_books,:user_id
  end

  def self.down
    drop_table :userized_books
  end
end
