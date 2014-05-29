RestaurantsBa.Restaurant = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),

  nekaFunkcija: function() {
  	return "neka bussines logika!?";
  }
});