# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Comment.create!(name: "Nick Picciuto", email: "napicciuto@gmail.com", comment: "hello travelers haven!!!") unless Comment.exists?(email: 'napicciuto@gmail.com')
Comment.create!(name: "Katie Baker", email: "katie@gmail.com", comment: "hello world") unless Comment.exists?(email: 'katie@gmail.com')
