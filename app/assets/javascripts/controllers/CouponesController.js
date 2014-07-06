RestaurantsBa.CouponesController = Ember.ArrayController.extend({
    needs: ["auth"],
    actions: {
        all: function() {
            var self = this;

            $.ajax({
                type: "GET",
                url: "api/coupones/search.json?description=" + this.get("description"),
                data: {

                },
                success: function(data) {
                    self.set('content', data.coupones);

                },
                error: function(jqXHR, textStatus, errorThrown) {}
            });
        },
        ReserveCoupon: function(coupone) {
            var self = this;
            var available = true;

            if (coupone._data.number_of_available > 0) {
                coupone._data.number_of_available -= 1;
            }


            $.ajax({
                url: "api/coupones/" + coupone.id,
                type: "PUT",
                data: {
                    "coupones[description]": coupone._data.description,
                    "coupones[number_of_available]": coupone._data.number_of_available,
                    "coupones[restaurant_id]": coupone._data.restaurant_id,
                    "coupones[available_from]": coupone._data.available_from,
                    "coupones[ends_at]": coupone._data.ends_at

                },
                success: function(data) {

                },
                error: function(jqXHR, textStatus, errorThrown) {
                    available = false;
                    // Takes a well-formed JSON string and returns the resulting JavaScript object.
                    // => {"users":["Password confirmation doesn't match Password"]} 

                    // Object { users: Array[1]}, a taj jedini je: 0: "Password confirmation doesn't match Password"

                }
            });

            if (available == true) {

                $.ajax({
                    url: "api/reservations",
                    type: "POST",
                    data: {
                        "reservation[user_id]": self.get("controllers.auth").currentUser.id,
                        "reservation[coupone_id]": coupone.id
                    },
                    success: function(data) {
                        alert("Vaša šifra je : " + data);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                        console.log(errorThrown);

                    }
                });
            }
        },
        allRestaurants: function() {
            /*$.ajax({
                url: "api/restaurants",
                type: "GET",
                success: function(data) {
                    console.log("SUCCESS", data);
                }
            });*/
        },
    }
});