RestaurantsBa.RegistrationController = Ember.ObjectController.extend({
	actions: {
		register: function() {
			var self = this;

			$.ajax({
				url: "api/users",
				type: "POST",
				data: {
					"user[email]": this.get("email"),
					"user[password]": this.get("password"),
					"user[password_confirmation]": this.get("password_confirmation"),
					"user[username]": this.get("username")
				},
				success: function(data) {
					console.log("SUCCESS", data);
				},
				error: function(jqXHR, textStatus, errorThrown) {
					//{"errors":{"password_confirmation":["doesn't match Password"]}} 
					console.log(jqXHR.responseText);
					self.set("errorMsg", jqXHR.responseText);
				}
			});
		},
		anotherAction: function() {

		}
	}
});