RestaurantsBa.RestaurantsNewController = Ember.ObjectController.extend({
	needs: ["auth"],
	user: Em.computed.alias("controllers.auth.currentUser"),
	actions: {
		create: function() {
			var self = this;

			$.ajax({
				url: "api/restaurants",
				type: "POST",
				data: {
					"restaurant[name]": this.get("name"),
					"restaurant[description]": this.get("description"),
					"restaurant[telephone]": this.get("telephone"),
					"restaurant[fb_url]": this.get("fb_url"),
					"restaurant[image]": this.get("image"),
					"restaurant[address]": this.get("address"),
					"restaurant[owner_id]": this.get("user").id
				},
				success: function(data) {
					console.log("SUCCESS", data);
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR.responseText); 

					console.log($.parseJSON(jqXHR.responseText).restaurants);
					self.set("errors", $.parseJSON(jqXHR.responseText).restaurants);
				}

			});
			 this.transitionToRoute('restaurants')
		}
	}
});