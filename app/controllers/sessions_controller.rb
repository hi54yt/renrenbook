class SessionsController < ApplicationController
  def new
    
  end

  def create 
    if User.renren_access_granted?
      access_token = session[:access_token]
      #get uid of renren
	  json_user = RenRenHelper.get_json_user(access_token)
	  renren_id = get_renren_id(json_user)
	  user =  User.create_or_obtain(renren_id,json_user)
	  
	  if user.nil
	    #why this would happen?
	  else
		redirect_to user
	  end
	else #ask for renren access grantation
      redirect grant_renren_access_path
	end
  end

  private 
   def get_renren_id json_user
     #TODO
   end
end
