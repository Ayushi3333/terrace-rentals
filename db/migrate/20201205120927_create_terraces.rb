class CreateTerraces < ActiveRecord::Migration[6.0]
  def change
    create_table :terraces do |t|
      t.string :description
      t.integer :size
      t.integer :floor
      t.integer :price

      t.timestamps
    end
  end
end
