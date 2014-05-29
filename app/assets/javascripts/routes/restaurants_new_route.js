RestaurantsBa.RestaurantsNewRoute = Ember.Route.extend({
	renderTemplate: function(){
	    this.render('restaurants.new', {
	      controller: 'restaurants_new'
		});
	},
    model: function() {
		return  Ember.Object.create();
	},
	setupController: function(controller, model) {
		controller.set("content", model);
		controller.set("errors", []);
	}
});