RestaurantsBa.EditRestaurantRoute = Ember.Route.extend({
	model : function(){
		var owner_id = this.controllerFor("auth").currentUser.id;

		var url = 'api/restaurants/' + owner_id + '/by_owner_id';
		return Ember.$.getJSON(url).then(function(data) {
			return data.restaurant;
		});
    },
   
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});