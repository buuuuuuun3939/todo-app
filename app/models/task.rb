class Task < ApplicationRecord
  belongs_to :user
  has_many :subtask, foreign_key: "task_id", dependent: :destroy
end
