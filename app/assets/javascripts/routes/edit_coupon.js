RestaurantsBa.EditCouponRoute = Ember.Route.extend({
	model : function(params){
		return this.store.find('coupone', params.id);
    },
   
    setupController: function(controller, model) {
    	controller.set("content", model);
    }
});