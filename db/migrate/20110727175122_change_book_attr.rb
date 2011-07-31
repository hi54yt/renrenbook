class ChangeBookAttr < ActiveRecord::Migration
  def self.up
    remove_column :books, :attribute
    add_column :books, :attr, :text
  end

  def self.down
  end
end
