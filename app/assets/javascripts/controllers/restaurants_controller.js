RestaurantsBa.RestaurantsController = Ember.ObjectController.extend({
	actions: {
		allRestaurants: function(){
			$.ajax({
				url: "restaurants",
				type: "GET",
				success: function(data) {
					alert("Svi kreirani restorani.");
				}
			});
		}
	}
});