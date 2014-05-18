RestaurantsBa.SessionsNewRoute = Ember.Route.extend({

	model: function(){
		return RestaurantsBa.Session.createRecord();
	},
	events:{
		save: function(){
			this.controller.content.save();
			this.transitionTo('index');
		},
		cancel: function(){
			this.controller.content.deleteRecord();
			this.transitionTo('index');
		}
	}
})