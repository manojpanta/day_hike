require 'rails_helper'
describe 'instance method' do
  it 'can total number of trips taken' do
    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')

    trip = trail.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = trail.trips.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')

    expect(trail.total_trips).to eq(2)
  end

end
