# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'User X', email: 'x@gmail.com' }, { name: 'User Y', email: 'y@gmail.com'}])

neighborhood1 = Neighborhood.create(name: 'Neighborhood 1', coordinate_range: 'A-B')
neighborhood2 = Neighborhood.create(name: 'Neighborhood 2', coordinate_range: 'A-B')

flats = Flat.create([{ name: 'User X', neighborhood: neighborhood1, location: 'A1' }, { name: 'User Y', neighborhood: neighborhood2, location: 'A2'}])
