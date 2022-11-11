class List < ApplicationRecord
  # association
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  # validation
  validates :name, presence: true, uniqueness: true
end
