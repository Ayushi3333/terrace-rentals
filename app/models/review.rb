class Review < ApplicationRecord
  belongs_to :terrace
  belongs_to :user
end
