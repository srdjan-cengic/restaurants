RestaurantsBa.RegistrationRoute = Ember.Route.extend({
	model: function() {
		return  Ember.Object.create();
	},
	setupController: function(controller, model) {
		// model = Objekat koji je vratio model-hook
		//  Ember.js automatically sets the controller's content to the 
		// return value of the model hook in the route.
		controller.set("content", model);
		controller.set("errorMsg", "");
	}
});