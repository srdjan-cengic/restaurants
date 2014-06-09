// Ti vec u trenutnku kada si na templejtu (login.hbs) uradio
// valueBinding="email" i valueBinding="password" na kontroleru
// su dodani Own propertiesi: email i password
// http://pokit.org/get/?97d6c5e9b355f7da53daa7ceb925d0a3.jpg
// to se sve vec desilo a da nisi manuleno napravio kontroler u uopste
// imao si this.route("login"); i login.hbs i nista vise

RestaurantsBa.LoginController = Ember.Controller.extend({
	needs: ["auth"],
	isFailed: false,
	
    actions: {
        login: function() {
            var self = this;

            $.ajax({
                type: "POST",
                url: "api/sessions",
                data: {
                    email: this.get("email"),
                    password: this.get("password")
                },
                success: function(data) {
                    self.get("controllers.auth").setCurrentUser(data);
                    self.controllerFor("profil").setCurrentUser(data);
                    self.transitionToRoute("restaurants");
                },
                error: function(jqXhr, textStatus, errorThrown) {
                    self.set("isFailed", true);
                }
            });
        }
    },
    getLoggedUser: function() {
        return this.get("controllers.auth").getCurrentUser;
    }
});