class SessionsController < ApplicationController
  
  def index
    render json: session.to_hash
  end

  # POST /sessions or /sessions.json
  def create
    #binding.pry
    user = User.find_by(email: params[:email])
    begin
      if user && user.authenticate(params[:password])
        log_in user
        response.status = 201
        render json: user.display_name
      end
    rescue
      response.status = 400
      render json: {message: "Bad request"}
    end
  end

  # DELETE /sessions/
  def destroy
    #binding.pry
    log_out if logged_in?
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.permit(:email, :password, :id)
    end
end
