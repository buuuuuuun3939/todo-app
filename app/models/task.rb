class Task < ApplicationRecord
  belongs_to :user  # :usersじゃなくて良い？
  #has_many :subtasks, foreign_key: "id", dependent: :destroy
  has_many :subtasks, dependent: :destroy
end
