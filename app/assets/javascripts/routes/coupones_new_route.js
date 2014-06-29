RestaurantsBa.CouponesNewRoute = Ember.Route.extend({
    renderTemplate: function() {
        this.render('coupones_new', {
            controller: 'coupones_new'
        });
    },
    model: function() {
        var self = this;
        var owner_id = this.controllerFor("auth").currentUser.id;
        console.log(owner_id)
        var url = 'api/restaurants/' + owner_id + '/restaurant_with_owner';
        $.ajax({
            type: "GET",
            url: 'api/restaurants/' + owner_id + '/restaurant_with_owner',
            data: {
                owner_id: owner_id
            },
            success: function(data) {
                var restorani = [];
                //console.log(data);
                //  console.log(data.restaurants);
                //self.controllerFor("coupones_new").set("content", data.restaurants);
                data.restaurants.forEach(function(entry) {
                    restorani.push({
                        'id': entry.id,
                        'name': entry.name
                    });
                });
                self.controllerFor("coupones_new").set("content", restorani);



            },
            error: function(jqXHR, textStatus, errorThrown) {}
        });
    },
    setupController: function(controller, model) {
        controller.set("content", model);

        controller.set("errors", []);
    }
});