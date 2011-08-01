class AddDoubanidToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :doubanid, :integer

    add_index :books, :doubanid
  end

  def self.down
    remove_column :books, :doubanid
    remove_index :books, :doubanid
  end
end
