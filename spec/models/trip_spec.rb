require 'rails_helper'
describe 'instance method' do
  it 'can return total hiking distance' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')

    total_hiking_distance = trail.length + trail1.length

    expect(trip.total_hiking_distance).to eq(total_hiking_distance)
  end
end
