class Song < ActiveRecord::Base
  belongs_to :movie
  has_many :ratings, as: :ratable
end
