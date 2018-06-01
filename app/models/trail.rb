class Trail < ApplicationRecord
  has_many :trail_trips
  has_many :trips, through: :trail_trips

  def total_trips
    trips.count
  end
end
