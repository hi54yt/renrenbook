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

class User < ActiveRecord::Base
  has_many :ownerships
  has_many :books, :through => :ownerships

end

