// Ember.ObjectController is part of Ember's Controller layer. 
// It is intended to wrap a single object, proxying unhandled attempts to get and set 
// to the underlying content object, and to forward unhandled action attempts to its target.

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
					// Takes a well-formed JSON string and returns the resulting JavaScript object.
					console.log(jqXHR.responseText); // => {"users":["Password confirmation doesn't match Password"]} 
					
					// Object { users: Array[1]}, a taj jedini je: 0: "Password confirmation doesn't match Password"
					console.log($.parseJSON(jqXHR.responseText).users);
					self.set("errors", $.parseJSON(jqXHR.responseText).users);
				}
			});
		},
		anotherAction: function() {

		}
	}
});