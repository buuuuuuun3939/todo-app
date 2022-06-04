class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :update]
  before_action :correct_user,   only: [:update]
  protect_from_forgery :except => [:create]

  # GET /users or /users.json
  def index
    begin 
      @users = User.all
      render json: @users
    rescue
      render json: {message: "get error."}
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save # DBにuserを保存
      log_in(@user)
      #response.status = 201
      render json: @user.display_name
    else
      response.status = 400
      render json: {message: "save error."}
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user = User.find(params[:id]) 
      # 本来はusersテーブル内のpassword_digestと、送られてきたold_passwordのハッシュが一致するかを確かめる
      
      if @user.password_digest == User.digest(update_user_params[:old_password])
        if @user.update(update_user_params)
          renderr json: {message: "update success."}
        end
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:display_name, :email, :password, :password_confirmation)
    end
    #def update_user_params
    #  params.require(:user).permit(:display_name, :email, :old_password, :password, :password_confirmation)
    #end
    
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
