class Movie < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :ratings, as: :ratable
  validates :name, presence: true
  accepts_nested_attributes_for :songs, :movie_actors, allow_destroy: true
  accepts_nested_attributes_for :ratings, allow_destroy: true
end
