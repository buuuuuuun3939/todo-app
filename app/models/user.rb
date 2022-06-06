class User < ApplicationRecord
  has_secure_password
  has_many :tasks, foreign_key: "id", dependent: :destroy 
  #has_one :session # 追記

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Validation Settings
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             allow_nil: false #uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, 
            allow_nil: false, confirmation: true
end
