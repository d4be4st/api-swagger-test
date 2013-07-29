# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'test1', password: 'filtered', email: 'e@e.com')
User.create(username: 'test2', password: 'filtered', email: 'b@e.com')
User.create(username: 'test3', password: 'filtered', email: 'c@e.com')
User.create(username: 'test4', password: 'filtered', email: 'w@e.com')