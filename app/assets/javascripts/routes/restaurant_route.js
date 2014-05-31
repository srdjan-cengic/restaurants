RestaurantsBa.RestaurantRoute = Ember.Route.extend({
	model : function(params){
		 return this.store.getById('restaurant', params.id);
    }
});