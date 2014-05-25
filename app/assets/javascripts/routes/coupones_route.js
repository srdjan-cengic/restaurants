RestaurantsBa.CouponesRoute = Ember.Route.extend({
    model: function() {
        return [{
            "coupones": {
                "id": 11,
                "description": "10% na veceru za dvoje.",
                "number_of_available": 10,
                "restaurant_id": 17,
                "created_at": "2014-05-05T21:20:49.457Z",
                "updated_at": "2014-05-05T21:20:49.457Z",
                "available_from": "2014-05-05T21:20:49.426Z",
                "ends_at": null
            }
        }, {
            "coupones": {
                "id": 12,
                "description": "10% na dorucak za jednu osobu.",
                "number_of_available": 20,
                "restaurant_id": 16,
                "created_at": "2014-05-05T21:20:49.485Z",
                "updated_at": "2014-05-05T21:20:49.485Z",
                "available_from": "2014-05-05T21:20:49.483Z",
                "ends_at": null
            }
        }, {
            "coupones": {
                "id": 13,
                "description": "10% na veceru za dvoje.",
                "number_of_available": 10,
                "restaurant_id": 16,
                "created_at": "2014-05-05T21:20:49.509Z",
                "updated_at": "2014-05-05T21:20:49.509Z",
                "available_from": "2014-05-05T21:20:49.507Z",
                "ends_at": "2014-06-04T21:20:49.507Z"
            }
        }, {
            "coupones": {
                "id": 14,
                "description": "30% na jelo po izboru.",
                "number_of_available": 5,
                "restaurant_id": 17,
                "created_at": "2014-05-05T21:20:49.551Z",
                "updated_at": "2014-05-05T21:20:49.551Z",
                "available_from": "2014-05-05T21:20:49.550Z",
                "ends_at": "2014-05-15T21:20:49.550Z"
            }
        }, {
            "coupones": {
                "id": 15,
                "description": "Besplatan ulaz i jedna konzumacija.",
                "number_of_available": 10,
                "restaurant_id": 16,
                "created_at": "2014-05-05T21:20:49.575Z",
                "updated_at": "2014-05-05T21:20:49.575Z",
                "available_from": "2014-05-05T21:20:49.574Z",
                "ends_at": "2014-05-15T21:20:49.574Z"
            }
        }]
    },
    setupController: function(controller, model) {
        // model = Objekat koji je vratio model-hook
        controller.set("content", model);
        controller.set("errorMsg", "");
    }
});