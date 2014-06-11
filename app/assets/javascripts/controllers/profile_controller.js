RestaurantsBa.ProfileController = Ember.Controller.extend({
    isFailed: false,
    currentUser: null,
    setCurrentUser: function(user) {
        if (typeof user === "undefined") this.set("currentUser", null);
        else this.set("currentUser", user);
    },

    actions: {
        update: function(user_id) {
            var self = this;

            $.ajax({
                url: "api/users/" + user_id,
                type: "PUT",
                data: {
                    "user[email]": this.get("content.email"),
                    "user[password]": this.get("password"),
                    "user[password_confirmation]": this.get("password_confirmation"),
                    "user[username]": this.get("content.username")
                },
                success: function(data) {
                    self.transitionToRoute('profile');
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