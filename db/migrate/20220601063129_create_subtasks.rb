class CreateSubtasks < ActiveRecord::Migration[7.0]
  def change
    create_table(:subtasks, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :task_id,     null: false, index: true, limit: 8
      t.string  :description, null: false
      t.boolean :completed,   null: false, default: false
    end
    add_foreign_key :subtasks, :tasks, name: :task_id, column: :id
  end
end
