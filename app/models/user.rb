class User < ActiveRecord::Base
  has_many :ownerships
  has_many :books, :through => :ownerships

	def initialize(renren_json_user)
    super

	  self.name = renren_json_user[0]['name']
		self.university = renren_json_user[0]['university_history'][0]['name']
		self.major = renren_json_user[0]['university_history'][0]['department']
		self.year_in = renren_json_user[0]['university_history'][0]['year']
    self.renren_id = renren_json_user[0]['uid']
    self.save

    #user = User.new(:name=>renren_json_user[0]['name'],:university=>renren_json_user[0]['']
	end

  #judge if the user has authorized renren access
  def self.renren_access_granted?
     return session[:renren_access_token].nil?
  end

  def self.create_or_obtain(renren_id,json_user)
    user = User.find_by_renren_id(renren_id)
	  if user.nil?#create a new user in our database
      user = User.new(json_user)
    end
	  user
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
#  renren_id  :string(255)
#

<<<<<<< HEAD
=======
class User < ActiveRecord::Base
  has_many :ownerships
  has_many :contacts 
  has_many :books, :through => :ownerships

end

>>>>>>> 9d8520a26919d100ddea3e527826d87986038c1d
