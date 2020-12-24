class ChangeDescriptionTypeOfTerrace < ActiveRecord::Migration[6.0]
  def change
    change_column :terraces, :description, :text
  end
end
