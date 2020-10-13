class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.references :producer, foreign_key: true
      t.timestamps
    end
  end
end
