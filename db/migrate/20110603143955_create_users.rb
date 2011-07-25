class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :university
      t.string :major
      t.date :year_in

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
