require 'rails_helper'
describe 'visitor visiting trips index' do
  it 'can show all the trips names' do

    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')

    visit trail_path(trail)

    expect(page).to have_content("This is #{trail.name}")
    expect(page).to have_content(trail.address)
    expect(page).to have_content(trail.length)
  end

  it 'can show total number of hiking trips where this trail was included' do

    trail = Trail.create(name: 'long trail', length: 3, address: 'denver')

    trip = trail.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = trail.trips.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')


    visit trail_path(trail)

    expect(page).to have_content("Total Number Of Trips On this Trail: 2")
  end
end
