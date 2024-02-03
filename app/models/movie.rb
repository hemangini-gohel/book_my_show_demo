class Movie < ApplicationRecord
  validates :title, :genre, presence: true
  has_many :show_times
end
