class RemoveCategoryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category, :string
  end
end
