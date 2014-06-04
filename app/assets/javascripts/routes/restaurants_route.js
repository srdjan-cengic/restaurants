RestaurantsBa.RestaurantsRoute = Ember.Route.extend({
	model : function(){
		return this.store.find('restaurant');
    },
    search: function() {
    	dzenida ="dzenisa";
			var self = this;
			console.log("IZZZ", this.content);
			$.ajax({
				url: "api/restaurants",
				type: "POST",
				data: {
					"restaurant[name]": this.get("search_name")
					
				},
				success: function(data) {
					self.transitionToRoute('index');
				},
				error: function(jqXHR, textStatus, errorThrown) {
					// Takes a well-formed JSON string and returns the resulting JavaScript object.
					console.log(jqXHR.responseText); // => {"users":["Password confirmation doesn't match Password"]} 
					
					// Object { users: Array[1]}, a taj jedini je: 0: "Password confirmation doesn't match Password"
					console.log($.parseJSON(jqXHR.responseText).users);
					self.set("errors", $.parseJSON(jqXHR.responseText).users);
				}
			});
		},
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});