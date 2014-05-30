RestaurantsBa.CouponesRoute = Ember.Route.extend({
    model: function() {
        return this.store.find('coupone');
    },
    setupController: function(controller, model) {
        controller.set("content", model);
    }
});