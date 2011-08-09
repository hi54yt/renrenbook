module RenrenHelper
  def sign_in(user)
    cookies.permanent.signed[:user_id]=user.id
		@current_user = user
	end

	def current_user
    @current_user ||= user_from_id(cookies.signed[:user_id])
	end

	def user_from_id(user_id)
    User.find_by_id(user_id)
	end

	def signed_in?
    !current_user.nil?
	end
end
