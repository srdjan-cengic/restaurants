RestaurantsBa.Restaurant = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  fb_url: DS.attr('string'),
  image: DS.attr('string'),
  telephone: DS.attr('string'),
  address: DS.attr('string'),
  adresaURL: DS.attr('string'),

  nekaFunkcija: function() {
  	return "neka bussines logika!?";
  },
  url: function(){
    var adresa = "https://www.google.com/maps/embed/v1/place?key=AIzaSyC5lp2B_bUPJPLCzOOYwi3-vM442m1PKsA&q=" + this.get("address");
    return adresa;
  }.property('address'),
  imagePath: function() {
    return "/assets/"+this.get("image");
  }.property('image')
});