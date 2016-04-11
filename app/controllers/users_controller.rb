class UsersController < ApplicationController 
  def index
    json_response [true,User.all,'success']
  end
  
  def create 
    resp = User.create(parameters)
    if resp.created_at != nil
      data = resp
      message = "User Created Successfully"
      success = true
    else
      data = nil
      message = resp.errors.full_messages.join(', ')
      success = false
    end
  json_response [success,data,message]
  end
  def show
    json_response [true,User.find(params[:id]),'success'] 
  end
  def update
    resp = User.update(params[:id], parameters)
    if resp.created_at != nil
      data =resp
      success = true
    else
      data = nil
      message = resp.errors.full_messages.join(',')
      success = false
    end
  json_response [success,data,message]
  end

  def login
    user = User.where("username = ? or email = ?", parameters[:user_login], parameters[:user_login])
    if !user.empty?
      saved_password = user.first.password  
      attempting_password = check_password(parameters[:salt], parameters[:password])
      if attempting_password == saved_password
        success = true
        data = user
        message = "User Successfully Logged in"
      else
        success = false
        data = nil
        message =  "salt or password is missing or incorrect"
      end
    else
      success = false
      data = nil
      message =  "No Record Found"
    end
    
    
    json_response [success,data,message] 
  end
  def check_password(salt, password)
    if !salt.blank? && !password.blank?
      Digest::SHA2.hexdigest("#{salt + password}")
    end
  end
  private
  def parameters
    params.permit(:id, :username, :email, :user_login, :salt, :password)
  end
end
