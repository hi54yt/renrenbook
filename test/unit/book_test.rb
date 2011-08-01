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
#  doubanid   :integer
#

