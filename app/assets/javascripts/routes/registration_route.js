RestaurantsBa.RegistrationRoute = Ember.Route.extend({
	model: function() {
		return  Ember.Object.create();
	},
	setupController: function(controller, model) {
		// model = Objekat koji je vratio model-hook
		controller.set("content", model);
		controller.set("errorMsg", "");
	}
});