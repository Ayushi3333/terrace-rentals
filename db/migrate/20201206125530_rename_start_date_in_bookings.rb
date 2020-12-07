class RenameStartDateInBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :start_date, :date
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
