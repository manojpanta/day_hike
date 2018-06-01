require 'rails_helper'
describe 'instance method' do
  it 'can return total hiking distance' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')

    total_hiking_distance = trail.length + trail1.length

    expect(trip.total_hiking_distance).to eq(total_hiking_distance)
  end
  it 'can return average hiking distance' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')

    average_hiking_distance = (trail.length + trail1.length) / 2

    expect(trip.average_hiking_distance).to eq(average_hiking_distance)
  end
  it 'can return longest hiking distance' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    trail2 = trip.trails.create(name: 'long trail123', length: 40, address: 'thorntnon')

    longest_hiking_distance =trail2.length

    expect(trip.longest_hiking_distance).to eq(longest_hiking_distance)
  end
  it 'can return shortest hiking distance' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    trip.trails.create(name: 'long trail123', length: 40, address: 'thorntnon')

    shortest_hiking_distance =trail.length

    expect(trip.shortest_hiking_distance).to eq(shortest_hiking_distance)
  end
end
