// app/assets/javascsripts/session.js

RestaurantsBa.Session = DS.Model.extend({
	email: DS.attr('string'),
	password: DS.attr('string')
});