# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# tribe.animals << Lion.new(name: "Simba", age: 10)
# tribe.animals << WildBoar.new(name: "Pumba", age: 30)
# tribe.animals << Meerkat.new(name: "Timon", age: 30)

marjon = Speaker.create(name:"Marjon", email:"marjon@email.com", password:"test123", password_confirmation: "test123")
valentine = Speaker.create(name:"Valentine", email:"valentine@email.com", password:"test123", password_confirmation: "test123")
david = Speaker.create(name:"David", email:"david@email.com", password:"test123", password_confirmation: "test123")
jake = Speaker.create(name:"Jake", email:"jake@email.com", password:"test123", password_confirmation: "test123")
flo = Speaker.create(name:"Flo", email:"flo@email.com", password:"test123", password_confirmation: "test123")


att1 = Attendee.create(name:"Attendee 1", email:"att1@email.com", password:"test123", password_confirmation: "test123")
att2 = Attendee.create(name:"Attendee 2", email:"att2@email.com", password:"test123", password_confirmation: "test123")
att3 = Attendee.create(name:"Attendee 3", email:"att3@email.com", password:"test123", password_confirmation: "test123")
att4 = Attendee.create(name:"Attendee 4", email:"att4@email.com", password:"test123", password_confirmation: "test123")
att5 = Attendee.create(name:"Attendee 5", email:"att5@email.com", password:"test123", password_confirmation: "test123")
