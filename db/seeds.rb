# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event = Event.create(
	name: 'Evento', 
	theme: 'Tema do evento',
	banner: nil, 
	description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua.'
)
event.save


['user', 'speaker', 'admin'].each do |role|
  Role.find_or_create_by(name: role)
end
admin_role = Role.last
user = User.create(
	email: 'grsabreu@gmail.com',
	password: 'dubidubi',
	password_confirmation: 'dubidubi',
	role: admin_role
)
user.save