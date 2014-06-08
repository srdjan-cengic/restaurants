RestaurantsBa.Restaurant = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  fb_url: DS.attr('string'),
  image: DS.attr('string'),
  telephone: DS.attr('string'),

  nekaFunkcija: function() {
  	return "neka bussines logika!?";
  },
  imagePath: function() {
    return "/assets/"+this.get("image");
  }.property('image')
});