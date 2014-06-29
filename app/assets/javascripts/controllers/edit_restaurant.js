RestaurantsBa.EditRestaurantController = Ember.ObjectController.extend({
    
    actions: {
		edit: function(restaurant_id) {
			var self = this;
			console.log("IZZZ", this.content);
			$.ajax({
				url: "api/restaurants/"+ restaurant_id,
				type: "PUT",
				data: {
					
					
					"restaurant[name]": this.get("name"),
					"restaurant[description]": this.get("description"),
					"restaurant[telephone]": this.get("telephone"),
					"restaurant[fb_url]": this.get("fb_url"),
					"restaurant[image]": this.get("image"),
					"restaurant[address]": this.get("address"),
			
					

				},
				success: function(data) {
					self.transitionToRoute('my_restaurant');
				},
				error: function(jqXHR, textStatus, errorThrown) {
					// Takes a well-formed JSON string and returns the resulting JavaScript object.
					// => {"users":["Password confirmation doesn't match Password"]} 
					
					// Object { users: Array[1]}, a taj jedini je: 0: "Password confirmation doesn't match Password"
					
				}
			});
		},
		anotherAction: function() {

		}

}

});