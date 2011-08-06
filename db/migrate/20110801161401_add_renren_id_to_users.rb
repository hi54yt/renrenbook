class AddRenrenIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :renren_id, :string
		add_index :users, :renren_id
  end


  def self.down
    remove_column :users, :renren_id
  end
end
