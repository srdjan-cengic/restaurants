RestaurantsBa.EditCouponController = Ember.ObjectController.extend({
   actions: {
	   	edit: function() {
	   		var self = this;
	   		self.transitionToRoute('edit_coupon');
	   	}
   }

});