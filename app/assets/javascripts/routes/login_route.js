RestaurantsBa.LoginRoute = Ember.Route.extend({
	model: function() {
		return Ember.Object.create();
	},
	setupController: function(controller, model) {
		controller.set("content", model);
	}
});