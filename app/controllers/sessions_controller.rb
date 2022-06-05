class SessionsController < ApplicationController
  #belongs_to :user # 追記
  
  # POST /sessions or /sessions.json
  def create
    #binding.pry
    user = User.find_by(email: session_params[:email])
    
    if user && user.authenticate(session_params[:password])
      log_in user
      #binding.pry
      response.status = 201
      render json: user.display_name
    else
      response.status = 400
      render json: {message: "Bad request"}
    end
  end

  # DELETE /sessions/
  def destroy
    #binding.pry
    #log_out if logged_in?
    
    if logged_in?
      #print(session[:user_id])
      response.status = 204
      log_out
    else
      print(session[:user_id])
      response.status = 401
      render json: {message: "session destroy error"}
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      #params.permit(:email, :password, :id)
      params.permit(:user_id, :email, :password)
    end
end
