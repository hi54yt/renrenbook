require 'test_helper'

class UserizedBookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

