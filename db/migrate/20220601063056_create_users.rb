class CreateUsers < ActiveRecord::Migration[7.0]
  def change  
    create_table(:users, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :display_name, default: "名無しさん"
    end
  end
end