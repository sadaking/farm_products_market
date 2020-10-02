class CreateFavoritePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_people do |t|
      t.integer :user_id
      t.integer :producer_id

      t.timestamps
    end
  end
end
