RestaurantsBa.RestaurantsController = Ember.ArrayController.extend({


	actions: {
		all: function(){
			var self = this;
		
			$.ajax({
				type: "GET",
				url: "api/restaurants/search.json?name="+this.get("name"),
				data: {
					
				},
				success: function(data) {
					self.set('content',data.restaurants);
					
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		},
		vote: function(restaurant_id) {
			$.ajax({
				type: "POST",
				url: "api/votes",
				data: {
					restaurant_id: restaurant_id
				},
				success: function(data) {
					alert("Now, you voted for your favourite restaurant.")
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