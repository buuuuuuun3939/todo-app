class User < ApplicationRecord
  has_secure_password
  has_many :tasks, foreign_key: "id", dependent: :destroy 

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 渡されたold_passwordがusersテーブル内のpassword_digestと一致したらtrueを返す
  #def existed_old_password?(string)
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

  # Validation Settings
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])+\z/
  #validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
  #          uniqueness: { case_sensitive: false }, allow_nil: false
  #validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, 
  #          allow_nil: false, confirmation: true
end
