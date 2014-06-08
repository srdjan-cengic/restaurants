RestaurantsBa.RestaurantsController = Ember.ArrayController.extend({
	content: [],
  filter: "",
  filteredContent: function() {
    var filter = this.get('filter');
    
    return this.get('content').filter(function(item, index, enumerable){
      return item.get('name').toLowerCase().match(filter.toLowerCase());
    });
  }.property('filter', 'content.@each'),

	actions: {
		all: function(){

			$.ajax({
				type: "GET",
				url: "api/restaurants/search.json?name="+this.get("naziv"),
				data: {
					
				},
				success: function() {
					this.transitionToRoute("coupones");
					
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		},
		vote: function(restaurant_id) {
			$.ajax({
				type: "POST",
				url: "api/votes",
				data: {
					restaurant_id: restaurant_id
				},
				success: function(data) {

				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		},

		numberOfVotes: function(restaurant_id){
			$.ajax({
				type: "GET",
				url: "api/votes",
				data: {
					restaurant_id: restaurant_id
				},
				success: function(data) {
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
	}
});