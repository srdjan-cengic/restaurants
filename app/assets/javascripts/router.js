// For more information see: http://emberjs.com/guides/routing/

RestaurantsBa.Router.map(function(match) {
  this.resource("sessions", { path: '/sessions' }, function(){
  	this.route('new');
  });
});
