# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

	user1 = User.create(user_name: 'Golfred', email: 'golfred@gmail.com')
	user2 = User.create(user_name: 'Hälh', email: 'Hälh@gmail.com')


	location1 = Location.create(name: 'Church', city: 'Helsinki', lat: '40', long: '-3')
 	location2 = Location.create(name: 'Mall', city: 'Helsinki', lat: '41', long: '-2')


	Visit.create( location_id: location1.id, user_id: user1.id, user_name: user1.user_name, from_date: '2007-01-01 10:00:00', to_date: '2007-01-04 10:00:00')
	Visit.create( location_id: location2.id, user_id: user2.id, user_name: user2.user_name, from_date: '2007-02-01 10:00:00', to_date: '2007-01-10 10:00:00')

