RestaurantsBa.CouponesRoute = Ember.Route.extend({
    model: function() {
        return this.store.find('coupone');
    },
    setupController: function(controller, model) {
        console.log(model.description)
        controller.set("content", model);

    }
});