class ProfilesController < ApplicationController  
  def index
    json_response [true,Profile.all,'success']
  end
  
  def create
  	user = User.where("username = ? or email = ?", parameters[:user_login], parameters[:user_login]) 
  	if !user.empty?
  		resp = user.first.profiles.create(parameters.except :user_login)
	    if resp.created_at != nil
	      data = resp
	      message = "Profile Created Successfully"
	      success = true
	    else
	      data = nil
	      message = resp.errors.full_messages.join(', ')
	      success = false
	    end	
  	else
  		data = nil
  		success = false
  		message = "Record Not Found"
  	end
  json_response [success,data,message]
  end 

  def update
  	user = User.where("username = ? or email = ?", parameters[:user_login], parameters[:user_login])
  	if !user.empty?
  		if user.first.profiles.first.update(parameters.except :user_login)
	      data = user.first.profiles.first.update(parameters.except :user_login)
	      success = true
	      message = "Record Updated"
	    else
	      resp = user.first.profiles.first.update(parameters.except :user_login)
	      data = nil
	      message = resp.errors.full_messages.join(',')
	      success = false
	    end
  	else
  		data = nil
  		success = false
  		message = "Record Not Found"
  	end
    
  json_response [success,data,message]
  end 
 
  private
  def parameters
    params.permit(:id, :first_name, :last_name, :nickname, :date_of_birth, :user_unique_id, :user_login)
  end
end
