class AddTitleToTerrace < ActiveRecord::Migration[6.0]
  def change
    add_column :terraces, :title, :string
  end
end
