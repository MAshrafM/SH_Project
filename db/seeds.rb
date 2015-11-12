# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.destroy_all
User.destroy_all

Room.create! [
	{name: "Living Room", description: "Large Room with House Entertainment, ac, lights and shades"},
	{name: "Bed Room", description: "Quite coozy Room with light dimmers, shades and secuirty monitor"},
	{name: "Dinning Room", description: "Light Control, Home Entertainment and shades"},
	{name: "Entrance", description: "The main entrance of the house with door looks and secuirty alarms"}
]

room = Room.find_by(name: "Living Room")
room.devices.create! [
 {light: true, ac:23, shade: false, door: true, camera: false}
]

users = User.create! [
	{username: "admin", password_digest: BCrypt::Password.create("admin")},
	{username: "owner", password_digest: BCrypt::Password.create("pass123")}
]

Room.all.each do |room|
	room.user = users.sample
	room.save!
end
