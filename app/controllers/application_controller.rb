class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  respond_to :json
  def angular
    render 'layouts/application'
  end
  def json_response(resp)
    success, data, message = resp
    render :json => {data:data,message:message}, :status => success ? 200 : 422
  end
end
