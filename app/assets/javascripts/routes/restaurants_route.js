RestaurantsBa.RestaurantsRoute = Ember.Route.extend({
	model : function(){
		return this.store.find('restaurant');
    },
   
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});