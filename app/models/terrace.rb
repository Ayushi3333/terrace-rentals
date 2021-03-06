class Terrace < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: :address,
                  using: {
                    tsearch: { prefix: true }
                  }

  def rating
    return 0 if self.reviews.empty?

    total = self.reviews.sum(:rating)
    total / self.reviews.count
  end
end
