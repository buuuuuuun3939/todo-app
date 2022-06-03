class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table(:tasks, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.string  :name, null: false
      t.string  :description
      t.date    :deadline
      t.boolean :completed, null: false, default: false
      t.integer :user_id, index: true, null: false, limit: 8
      t.integer :assignee_id, index: true, limit: 8
      t.boolean :public, null: false, default: false
    end
    # add_foreign_keyは一度db:migrateした後に利用する
    add_foreign_key :tasks, :users, name: :user_id, column: :id
    add_foreign_key :tasks, :users, name: :assignee_id, column: :id
  end
end