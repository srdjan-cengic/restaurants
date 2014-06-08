RestaurantsBa.MyRestaurantRoute = Ember.Route.extend({
	model : function(){
		return this.store.find('restaurant',2);
    },
   
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});