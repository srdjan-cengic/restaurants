RestaurantsBa.EditRestaurantController = Ember.Controller.extend({
    isFailed: false,
    currentUser: null,
    setCurrentUser: function(user) {
        if (typeof user === "undefined") this.set("currentUser", null);
        else this.set("currentUser", user);
    },
    actions: {
		edit: function() {
			var self = this;
			console.log("IZZZ", this.content);
			$.ajax({
				url: "api/restaurants/2",
				type: "PUT",
				data: {
					
					
					"user[description]": this.get("description")
					

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