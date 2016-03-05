# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times {|x| Contact.create name: "Project #{x}", description: "Description #{x}"}

Contact.create name: "Rachel", address: "Direccion 1", phone_number: "999111222", email_address: "email1@ironhack.com"
Contact.create name: "Ruben", address: "Direccion 2", phone_number: "777666555", email_address: "email2@ironhack.com"
Contact.create name: "Eli", address: "Direccion 3", phone_number: "999888111", email_address: "email3@ironhack.com"
Contact.create name: "Javi", address: "Direccion 4", phone_number: "555777333", email_address: "email4@ironhack.com"
Contact.create name: "Adrian", address: "Direccion 5", phone_number: "000333111", email_address: "email5@ironhack.com"
