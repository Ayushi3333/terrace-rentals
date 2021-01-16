class AddUserReferenceToTerraces < ActiveRecord::Migration[6.0]
  def change
    add_reference :terraces, :user, foreign_key: true
  end
end
