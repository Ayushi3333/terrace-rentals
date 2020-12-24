class Terrace < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
end
