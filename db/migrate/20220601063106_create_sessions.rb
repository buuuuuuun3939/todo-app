class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table(:sessions, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.references :user, column: :id, null: false, foreign_key: true 
      t.timestamps
    end
    #add_foreign_key :sessions, :users, name: :user_id, column: :id
  end
end
