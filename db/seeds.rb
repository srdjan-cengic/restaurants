# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

File.open("./users_seed.txt") do |users|
  users.read.each_line do |user|
    email, password = user.chomp.split("|")
    
    new_user = User.new(email: email, password: password, confirmed: true, last_login: Time.now)
    new_user.save
  end
end