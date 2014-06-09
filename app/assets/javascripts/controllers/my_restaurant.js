RestaurantsBa.MyRestaurantController = Ember.ObjectController.extend({
   actions: {
	   	delete: function(restaurant_id) {
	   		alert(restaurant_id);
	   		var self = this;
	   		$.ajax({
	   			url: "api/restaurants/" + restaurant_id,
	   			type: "DELETE",
	   			success: function(data) {
	   				self.transitionToRoute("restaurants");
	   			}
	   		});
	   	},
	   		edit: function() {
	   		
	   		var self = this;
	   		self.transitionToRoute('edit_restaurant');
	   	}
   }

});