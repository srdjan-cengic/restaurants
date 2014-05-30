RestaurantsBa.Coupone = DS.Model.extend({
    description: DS.attr('string'),
    number_of_available: DS.attr('string'),
    restaurant_id: DS.attr('string'),

    nekaFunkcija: function() {
        return "neka bussines logika!?";
    }
});