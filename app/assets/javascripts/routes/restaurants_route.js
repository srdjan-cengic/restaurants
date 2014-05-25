RestaurantsBa.RestaurantsRoute = Ember.Route.extend({
	model : function(){
        var restaurants = this.store.all('restaurant');
        return restaurants;
    }
});