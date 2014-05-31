RestaurantsBa.RestaurantsController = Ember.ArrayController.extend({
	nazivKontrolera: "RestaurantsController",
	actions: {
		allRestaurants: function(){
		},
		vote: function(restaurant_id) {
			$.ajax({
				type: "POST",
				url: "api/votes",
				data: {
					restaurant_id: restaurant_id
				},
				success: function(data) {
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		},

		numberOfVotes: function(restaurant_id){
			$.ajax({
				type: "GET",
				url: "api/votes",
				data: {
					restaurant_id: restaurant_id
				},
				success: function(data) {
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
	}
});