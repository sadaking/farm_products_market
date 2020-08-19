class ChangeColumnsAddNotnullOnProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :harvest_date, :datetime, null: false
  end
end
