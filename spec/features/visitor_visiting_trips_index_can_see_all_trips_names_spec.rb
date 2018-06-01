require 'rails_helper'
"As a visitor,
when I visit the hiking trips index page,
and I click on the name of a hiking trip,
I see a unique page for that hiking trip."
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
  it 'can click on trip  name to go to trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = Trip.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')

    # trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    # trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')

    visit trips_path

    click_on trip.name

    expect(current_path).to eq(trip_path(trip))
  end

  it 'can see all the trails included in that trip on trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')

    visit trip_path(trip)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.address)
    expect(page).to have_content(trail.length)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail1.address)
    expect(page).to have_content(trail1.length)
  end
  it 'can see total hiking distance in trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    total_hiking_distance = trail.length + trail1.length

    visit trip_path(trip)


    expect(page).to have_content("Total Hiking Distance: #{total_hiking_distance}")
  end
  it 'can see average hiking distance in trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trail1 = trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    average_hiking_distance = (trail.length + trail1.length) / 2

    visit trip_path(trip)


    expect(page).to have_content("Average Hiking Distance: #{average_hiking_distance}")
  end
  it 'can see longest hiking distance in trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    trail2 = trip.trails.create(name: 'long trail123', length: 40, address: 'thorntnon')
    longest_hiking_distance = trail2.length

    visit trip_path(trip)


    expect(page).to have_content("Longest Hiking Distance: #{longest_hiking_distance}")
  end
  it 'can see shortest hiking distance in trip show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'long trail', length: 3, address: 'denver')
    trip.trails.create(name: 'long trail123', length: 30, address: 'thorntnon')
    trip.trails.create(name: 'long trail123', length: 40, address: 'thorntnon')
    shortest_hiking_distance = trail1.length


    visit trip_path(trip)


    expect(page).to have_content("Shortest Hiking Distance: #{shortest_hiking_distance}")
  end

  it 'can click on trail name to go to trail show page' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'long trail', length: 3, address: 'denver')

    visit trip_path(trip)

    click_on trail.name


    expect(current_path).to eq(trail_path(trail))
  end

end
