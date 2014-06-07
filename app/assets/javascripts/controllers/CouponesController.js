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
        },
        deleteCoupon: function(coupone) {
            if (window.confirm("Are you sure you want to delete this coupon?")) {

                var coupone_id = coupone.get('id');

                $.ajax({
                    type: "DELETE",
                    url: "api/coupones/" + coupone_id + "/",
                    success: function() {
                        this.transitionToRoute("coupones");
                    }, 
                    error: function() {
                        alert("delete failed");
                    }             
                });
            }
        },
    }
});