class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, unique: true
      t.text :summary, null: false
      t.string :cover_url, null: false
    end
  end
end
