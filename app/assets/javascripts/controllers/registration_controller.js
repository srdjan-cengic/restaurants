RestaurantsBa.RegistrationController = Ember.ObjectController.extend({
	actions: {
		register: function() {
			console.log(this.get("username"));
			$.ajax({
				url: "users",
				type: "POST",
				data: {
					"user[email]": this.content.email,
					"user[password]": this.content.password,
					"user[password_confirmation]": this.content.password_confirmation,
					"user[username]": this.content.username
				},
				success: function(data) {
					alert("srleeeeee");
				}
			});
		}
	}
});