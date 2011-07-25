class CreateGuanxiOfBookAuthors < ActiveRecord::Migration
  def self.up
    create_table :guanxi_of_book_author do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps
    end

	add_index :guanxi_of_book_author,:book_id
	add_index :guanxi_of_book_author,:author_id
	add_index :guanxi_of_book_author,[:book_id,:author_id],:unique=>true
  end

  def self.down
    drop_table :guanxi_of_book_author
  end
end
