class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :password_digest
#      t.string :encrypted_password, null: false, default: ""
      
      t.timestamps null: false
    end
  end
end
