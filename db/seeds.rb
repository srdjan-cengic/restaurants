# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create(name: "superadmin")
Role.create(name: "storeadmin")
Role.create(name: "user")

User.delete_all

File.open("./users_seed.txt") do |users|
  users.read.each_line do |user|
    email, password, name, username = user.chomp.split("|")

    new_user = User.new(email: email, password: password, confirmed: true, 
    	                last_login: Time.now, name: name, username: username)

    if new_user.email == "super.admin@gmail.com"
    	new_user.role = Role.find_by_name("superadmin")
    else
    	new_user.role = Role.find_by_name("user")
    end
    
    new_user.save

  end
end

Restaurant.delete_all

restourant_list = [
	["Restaurants near the Bridgewater Hall", 
	 "Mr Coopers House & Garden combines modern touches with the history and heritage of Mr Cooper himself, whose house and famous gardens sat on the site back in 1819.
	  Thomas Cooper was a popular figure in Manchester. The family were coach-makers by trade and their garden on the site of The Midland was famous for its strawberries, gooseberries, apples and flowers. On special days of the year, The Coopers would welcome the public in to stroll the gardens and picnic there.
	  Cooper Street, the short street across St Peter's Square on the other side of Princess Street, used to extend as far back as The Midland and was named after the family.",
	 "0872 437 9508",
	 "https://www.facebook.com/pages/Element-Sarajevo/604630479567968",
	 "zouk-restaurant2.jpg"],
	 ["The French",
	  "The French strikes the perfect balance between heritage and progressive cuisine. While the restaurant is steeped in history, the current menu offers modern British food that delivers consistently excellent flavours by using the best seasonal produce and the very latest technological advances.
       A large proportion of the ingredients are grown on one there personal farms, located throughout the North of England. Organic, hand-picked produce is complemented by ingredients from our carefully-chosen suppliers across the UK – allowing complete control over every element of the menu. In fact, we believe that the provenance of our food is our ultimate commitment to quality.",
	  "0872 332 9899",
	  "https://www.facebook.com/pages/Pivnica-HS-Sarajevo/191359830900109?rf=191428997567001",
	  "ribbon-restaurant-2872.jpg"
	],
	["Berlin restaurant",
 	  "Its menu lists a range of gourmet dishes that is says are inspired by the eating habits of the Waririca – an Amazonian tribe infamous for its cannibalism. Highlights include bolinho, a traditional Brazilian main course described as “fried tatar balls with a sweet-sour dip” and feijoada, a meal consisting of various pieces of meat with black beans and rice.",
 	  "0872 112 2258",
 	  "https://www.facebook.com/pages/Pivnica-HS-Sarajevo/191359830900109?rf=191428997567001",
 	  "restaurant_undersea.jpg"
	]
]

restourant_list.each do |name, desc, telephone, fb, image|
	Restaurant.create(name: name, 
					  description: desc, 
					  telephone: telephone, 
					  fb_url: fb, 
					  image: image,
					  owner_id: (User.first.id..User.last.id).to_a.sample)
end

Coupone.delete_all
Coupone.create(description: "10% na veceru za dvoje.", number_of_available: 10,
	           restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
	           available_from: Time.now)

Coupone.create(description: "10% na dorucak za jednu osobu.", number_of_available: 20,
	           restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
	           available_from: Time.now)

Coupone.create(description: "10% na veceru za dvoje.", number_of_available: 10,
	           restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
	           available_from: Time.now, ends_at: 30.days.from_now)

Coupone.create(description: "30% na jelo po izboru.", number_of_available: 5,
	           restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
	           available_from: Time.now, ends_at: 10.days.from_now)

Coupone.create(description: "Besplatan ulaz i jedna konzumacija.", number_of_available: 10,
	           restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
	           available_from: Time.now, ends_at: Time.now + 10.days)



