class SessionsController < ApplicationController
  #belongs_to :user # 追記
  
  # POST /sessions or /sessions.json
  def create
    #binding.pry
    user = User.find_by(email: session_params[:email])
    
    if user && user.authenticate(session_params[:password])
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
    if logged_in?
      log_out
      response.status = 204
      render json: {message: "success"}
    else
      response.status = 401
      render json: {message: "session destroy error"}
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.permit(:email, :password)
    end
end
