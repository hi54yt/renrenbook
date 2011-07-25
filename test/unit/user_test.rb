require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  university :string(255)
#  major      :string(255)
#  year_in    :date
#  created_at :datetime
#  updated_at :datetime
#

