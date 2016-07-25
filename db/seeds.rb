# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

proj1 = Project.create(speaker:marjon, name:"First Project", description:"This is Marjon's project and this is a description for it.")
proj2 = Project.create(speaker: valentine, name:"Second Project", description:"This is Marjon's project and this is a description for it.")
proj3 = Project.create(speaker: david, name:"Third Project", description:"This is Marjon's project and this is a description for it.")
proj4 = Project.create(speaker: jake, name:"Fourth Project", description:"This is Marjon's project and this is a description for it.")
proj5 = Project.create(speaker: flo, name:"Fifth Project", description:"This is Marjon's project and this is a description for it.")
#
