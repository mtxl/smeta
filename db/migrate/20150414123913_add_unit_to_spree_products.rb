class AddUnitToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :unit, :string
  end
end
