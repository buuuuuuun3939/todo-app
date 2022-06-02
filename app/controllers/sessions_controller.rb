class SessionsController < ApplicationController
  # GET /sessions or /sessions.json
  def index
    @sessions = Session.all
  end

  # POST /sessions or /sessions.json
  def create
    #binding.pry
    user = User.find_by(email: params[:session][:email].downcase) #　downcaseをつけるとundefined method 'downcase'
    if user && user.authenticate(params[:session][:password])
      log_in user
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)

    #else
      #render 'new'
    end
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    #binding.pry
    log_out if logged_in?
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.fetch(:session, {})
      params.permit(:email, :password, :id)
    end
end
