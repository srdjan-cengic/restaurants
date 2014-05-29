RestaurantsBa.CouponesController = Ember.ArrayController.extend({
    actions: {
        AllCoupones: function() {
            $.ajax({
                url: "coupones",
                type: "GET",
                success: function(data) {
                    alert("Svi kuponi su tu");
                }
            });
        }
    }
});