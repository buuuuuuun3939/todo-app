class User < ApplicationRecord
  has_secure_password
  #validates :password, presence: true, length: { minimum: 8 }, allow_nil: false, confirmation: true
end
