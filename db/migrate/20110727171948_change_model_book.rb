class ChangeModelBook < ActiveRecord::Migration
  def self.up
    remove_column :books, :name
    remove_column :books, :pubdate
    add_column :books, :title, :string
    add_column :books, :doubanlink, :string
    add_column :books, :imagelink, :string
    add_column :books, :author, :string
    add_column :books, :ISBN10, :string
    add_column :books, :ISBN13, :string
    add_column :books, :attribute, :text
  end

  def self.down
  end
end
