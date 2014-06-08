RestaurantsBa.CouponesNewRoute = Ember.Route.extend({
	renderTemplate: function(){
	    this.render('coupones_new', {
	      controller: 'coupones_new'
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