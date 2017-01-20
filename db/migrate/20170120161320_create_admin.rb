class CreateAdmin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.timestamps null: false
    end
  end
end
