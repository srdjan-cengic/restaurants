RestaurantsBa.AuthController = Ember.ObjectController.extend({
	currentUser: null,
	isAuthenticated: Em.computed.notEmpty("currentUser.email"),
	setCurrentUser: function(user) {
		if(typeof user === "undefined") this.set("currentUser", null);
		else this.set("currentUser", user);
	},
	getCurrentUser: function() {
		return this.get("currentUser");
	}
});