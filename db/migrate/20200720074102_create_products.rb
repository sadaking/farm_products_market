class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.text :content, null: false
      t.string :category
      t.datetime :harvest_date
      t.string :farm_name, null: false
      t.string :farm_street_address, null: false
      t.timestamps
    end
  end
end
