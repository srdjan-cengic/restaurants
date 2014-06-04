RestaurantsBa.Coupone = DS.Model.extend({
    description: DS.attr('string'),
    number_of_available: DS.attr('number'),
    restaurant_id: DS.attr('number'),
    restaurant: DS.belongsTo('RestaurantsBa.Restaurant'),

    nekaFunkcija: function() {
        return "neka bussines logika!?";
    }
});