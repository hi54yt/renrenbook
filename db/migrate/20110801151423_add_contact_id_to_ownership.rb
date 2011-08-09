class AddContactIdToOwnership < ActiveRecord::Migration
  def self.up
    add_column :ownerships, :contact_id, :integer
  end

  def self.down
    remove_column :ownerships, :contact_id
  end
end
