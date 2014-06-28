RestaurantsBa.CouponesNewController = Ember.ObjectController.extend({
	
	actions: {
		create: function() {
			var self = this;

			$.ajax({
				url: "api/coupones",
				type: "POST",
				data: {
					"coupones[description]": this.get("description"),
					"coupones[number_of_available]": this.get("number_of_available"),
					"coupones[restaurant_id]": this.get("restaurant_id"),
					"coupones[available_from]": this.get("available_from"),
					"coupones[ends_at]": this.get("ends_at")
				},
				success: function(data) {
					console.log("SUCCESS", data);
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR.responseText); 

					console.log($.parseJSON(jqXHR.responseText).coupones);
					self.set("errors", $.parseJSON(jqXHR.responseText).coupones);
				}

			});
			this.transitionToRoute('coupones');
		}
	}
});