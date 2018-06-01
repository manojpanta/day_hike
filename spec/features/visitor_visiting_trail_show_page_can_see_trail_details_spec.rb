require 'rails_helper'
describe 'visitor visiting trail show page ' do
  it 'can show all the the trail details' do

    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')

    visit trail_path(trail)

    expect(page).to have_content("This is #{trail.name}")
    expect(page).to have_content(trail.address)
    expect(page).to have_content(trail.length)
  end

  it 'can show all the trip taken and total trip distance' do

    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = Trail.create(name: 'long trail', length: 4, address: 'denver')

    trip = trail.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trip1 = trail1.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trip1 = trail.trips.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')


    visit trail_path(trail)

    expect(page).to have_content(trip.name)
    expect(page).to have_content(trip.total_hiking_distance)

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip1.total_hiking_distance)
  end

  it 'can show total number of hiking trips where this trail was included' do

    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')

    trip = trail.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = trail.trips.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')


    visit trail_path(trail)

    expect(page).to have_content("Total Number Of Trips On this Trail: 2")
  end
end
