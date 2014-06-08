RestaurantsBa.Coupone = DS.Model.extend({
    description: DS.attr('string'),
    number_of_available: DS.attr('number'),
    restaurant_id: DS.attr('number'),
    available_from: DS.attr('date'),
    ends_at: DS.attr('date'),
    restaurant: DS.belongsTo('RestaurantsBa.Restaurant'),

    nekaFunkcija: function() {
        return "neka bussines logika!?";
    }
});