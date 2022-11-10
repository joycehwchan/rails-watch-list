class Movie < ApplicationRecord
  # association
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  # validation
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
