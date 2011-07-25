# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  publisher  :string(255)
#  pubdate    :date
#  created_at :datetime
#  updated_at :datetime
#
class Book < ActiveRecord::Base
  has_many :authors,:through=>'guanxi_of_book_author'
  has_many :users,:through=>'guanxi_of_book_user'
end
