class UserizedBook < ActiveRecord::Base

  belongs_to :user
  belongs_to :book
end

# == Schema Information
#
# Table name: userized_books
#
#  id         :integer         not null, primary key
#  book_id    :integer
#  user_id    :integer
#  comment    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

