require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

