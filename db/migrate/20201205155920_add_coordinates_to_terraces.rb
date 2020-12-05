class AddCoordinatesToTerraces < ActiveRecord::Migration[6.0]
  def change
    add_column :terraces, :latitude, :float
    add_column :terraces, :longitude, :float
  end
end
