RestaurantsBa.MyRestaurantRoute = Ember.Route.extend({
	model : function(){
		var owner_id = this.controllerFor("auth").currentUser.id;

		var url = 'api/restaurants/' + owner_id + '/by_owner_id';
		return Ember.$.getJSON(url).then(function(data) {
			data.restaurant.image = "/assets/" + data.restaurant.image;
			var adresa = "https://www.google.com/maps/embed/v1/place?key=AIzaSyC5lp2B_bUPJPLCzOOYwi3-vM442m1PKsA&q=" + data.restaurant.address;
			data.restaurant.adresaURL = adresa;
			return data.restaurant;
		});
    },
   
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});