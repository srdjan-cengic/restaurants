RestaurantsBa.RestaurantsController = Ember.ObjectController.extend({
	actions: {
		allRestaurants: function(){
			$.ajax({
				url: "api/restaurants",
				type: "GET",
				success: function(data) {
					console.log("SUCCESS", data);
				}
			});
		}
	}
});