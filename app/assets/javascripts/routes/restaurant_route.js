RestaurantsBa.RestaurantRoute = Ember.Route.extend({
	model : function(params){
		 return this.store.find('restaurant', params.id);
    },
     setupController: function(controller, model) {
    	controller.set("content", model);
    }
});