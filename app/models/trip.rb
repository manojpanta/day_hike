class Trip < ApplicationRecord
  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_hiking_distance
    trails.sum(:length)
  end

  def average_hiking_distance
    trails.average(:length).to_i
  end

  def longest_hiking_distance
    trails.maximum(:length).to_i
  end

  def shortest_hiking_distance
    trails.minimum(:length).to_i
  end
end
