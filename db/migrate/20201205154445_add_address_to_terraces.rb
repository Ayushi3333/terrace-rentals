class AddAddressToTerraces < ActiveRecord::Migration[6.0]
  def change
    add_column :terraces, :address, :string
  end
end
