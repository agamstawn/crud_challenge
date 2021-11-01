# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

After cloning the project, you should change directory into project folder 'crud_challenge'


* Ruby version
Please use ruby 2.5.3 or above 

run **bundle install**

* Database creation and initialization

run **rails db:setup** to create, migrate and seeding the database

* Operation

run rails s to starting application

you can visit :

http://localhost:3000/api/v1/users to see all users

http://localhost:3000/api/v1/neighborhoods to see all neighborhoods

http://localhost:3000/api/v1/flats to see all flats

you can do:

Create user

**curl --header "Content-Type: application/json" --request POST --data '{"name": "Agam 2", "email": "setiawanagam@gmail.com"}' http://localhost:3000/api/v1/users -v **


Read data user
**curl http://localhost:3000/api/v1/users**

Update data user with id = 2
**curl --heacurl --header "Content-Type: application/json" --request PUT --data '{"name": "Agam 2", "email": "setiawanagamaa@gmail.com"}' http://localhost:3000/api/v1/users/2 -v
**

Delete user with id = 2
**curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/api/v1/users/2 -v **

* How to run the test suite

run **rspec** to running all test spec

or

run **rpsec spec/requests/user_spec.rb** to run test of user spec 
