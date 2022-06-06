class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :update]
  before_action :correct_user,   only: [:update]
  protect_from_forgery :except => [:create]

  # GET /users or /users.json
  def index
    if @users = User.all
      response.status = 200
      render json: @users
    else
      render json: {message: "get error."}
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save # DBにuserを保存
      log_in(@user)
      response.status = 201
      render json: @user.display_name
    else
      response.status = 400
      render json: {message: "save error."}
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user = User.find(params[:id])
      #binding.pry
      if @user.authenticate(update_user_params[:old_password])
        if @user.update(user_params)
          response.status = 200
          render json: {message: "update success."}
        else
          response.status = 400
          render json: {message: "bad request"}
        end
      else
        response.status = 401
        render json: {"message": "auth error"}
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:display_name, :email, :password, :password_confirmation)
    end
    def update_user_params
      params.permit(:display_name, :email, :old_password, :password, :password_confirmation)
    end
    
    # beforeアクション
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
      end
    end
   
    # beforeアクション 
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
    end
end
