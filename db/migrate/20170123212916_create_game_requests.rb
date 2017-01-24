class CreateGameRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :gamerequests do |t|
      t.string :name, null: false
      t.string :summary, null: false
      t.string :cover_url, null: false
      t.timestamps true
      t.belongs_to :user, null: false
    end
  end
end
