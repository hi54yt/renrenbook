# == Schema Information
#
# Table name: ownerships
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  book_id    :integer
#  price      :float
#  howold     :integer
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#

class Ownership < ActiveRecord::Base
  attr_accessible :user_id, :book_id, :price, :howold, :comment

  belongs_to :user
  belongs_to :book

  validates :user_id, :presence => true
  validates :book_id, :presence => true
      
end

