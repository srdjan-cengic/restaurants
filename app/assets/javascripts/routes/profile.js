RestaurantsBa.ProfileRoute = Ember.Route.extend({
    model: function() {
        var profile = this.controllerFor("auth").currentUser;
        console.log(profile);
        return profile;
    },

    setupController: function(controller, model) {
        controller.set("content", model);
    }
});