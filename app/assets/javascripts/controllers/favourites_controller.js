RestaurantsBa.FavouritesController = Ember.ArrayController.extend({
	needs: ["auth"],
	isAuthenticated: Em.computed.alias("controllers.auth.isAuthenticated"),
	user: Em.computed.alias("controllers.auth.currentUser")
});