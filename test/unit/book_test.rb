require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

