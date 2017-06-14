class Users < ActiveRecord::Migration[5.1]
  def up
    create_table :users, id: false do |s|
      s.string :username, primary_key: true
      s.string :email, :null => false
      s.string :name, :null => false
    end
  end

  def down
    drop_table :users
  end
end
