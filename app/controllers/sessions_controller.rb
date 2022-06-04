class SessionsController < ApplicationController
  
  # POST /sessions or /sessions.json
  def create
    #binding.pry
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      log_in user
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
    #response.status = 200
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.permit(:email, :password, :id)
    end
end
