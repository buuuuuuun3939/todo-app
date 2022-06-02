class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  protect_from_forgery :except => [:create]
  wrap_parameters :user, include: [:email, :display_name, :password, :password_confirmation]

  # GET /users or /users.json
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
        response.status = 200
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      update_info = JSON.parse(request.body.read)
      #if User.find_by(params[:id], update_info[:old_password]) #ここうまく実装できないから後でやる
      if @user = User.find(params[:id]) 
        if @user.update(update_user_params)
          format.json { render :show, status: :ok, location: @user }
        end
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = User.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def user_params
      #params.fetch(:user, {})
      #params.require(:user).permit(:display_name, :email, :password, :password_confirmation)
      params.permit(:display_name, :email, :password, :password_confirmation)
    end
    def update_user_params
      params.require(:user).permit(:display_name, :email, :old_password, :password, :password_confirmation)
    end
    
    # beforeアクション
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
