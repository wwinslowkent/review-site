class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.belongs_to :user, null: false
      t.belongs_to :game, null: false
      t.string :rating, null: false
    end
  end
end
