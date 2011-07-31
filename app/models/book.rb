# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  publisher  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  doubanlink :string(255)
#  imagelink  :string(255)
#  author     :string(255)
#  ISBN10     :string(255)
#  ISBN13     :string(255)
#  attr       :text
#

class Book < ActiveRecord::Base
  attr_accessible :attr, :publisher, :title, :doubanlink, :imagelink, :author, :ISBN10, :ISBN13
  has_many :ownerships
  has_many :users, :through => :ownerships
end

