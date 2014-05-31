RestaurantsBa.CouponesController = Ember.ArrayController.extend({
    nazivKontrolera: "Coupones Controller",
    actions: {
        allRestaurants: function() {
            /*$.ajax({
                url: "api/restaurants",
                type: "GET",
                success: function(data) {
                    console.log("SUCCESS", data);
                }
            });*/
        }
    }
});