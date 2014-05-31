RestaurantsBa.ApplicationController = Ember.Controller.extend({
	needs: ["auth"],
	isLoggedIn: Em.computed.alias("controllers.auth.isAuthenticated"),
	actions: {
		logout: function() {
			this.get("controllers.auth").setCurrentUser();
			this.transitionToRoute("index");
		}
	}
});