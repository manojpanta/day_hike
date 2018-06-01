require 'rails_helper'
"As a visitor,
when I visit the hiking trips index page,
I see a list of all hiking trip names in
the database.
"
describe 'visitor visiting trips index' do
  it 'can show all the trips names' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = Trip.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')

    # trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    # trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')


    visit trips_path

    expect(page).to have_content(trip.name)
    expect(page).to have_content(trip1.name)
  end
end
