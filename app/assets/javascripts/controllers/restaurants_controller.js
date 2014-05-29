RestaurantsBa.RestaurantsController = Ember.ArrayController.extend({
	nazivKontrolera: "RestaurantsController",
	actions: {
		allRestaurants: function(){
			/*$.ajax({
				url: "api/restaurants",
				type: "GET",
				success: function(data) {
					console.log("SUCCESS", data);
				}
			});*/
		}
	}
});