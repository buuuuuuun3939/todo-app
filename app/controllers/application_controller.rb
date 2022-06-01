class ApplicationController < ActionController::API
  #protect_from_forgery with: :null_session
  include SessionsHelper
  
  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
end