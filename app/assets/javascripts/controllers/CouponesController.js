RestaurantsBa.CouponesController = Ember.ArrayController.extend({
    
    content: [],
    filter: "",

    filteredContent: function() {
        var filter = this.get('filter');
        
        return this.get('content').filter(function(item, index, enumerable){
          return item.get('description').toLowerCase().match(filter.toLowerCase());
        });
    }.property('filter', 'content.@each'),


    actions: {
        allRestaurants: function() {
            /*$.ajax({
                url: "api/restaurants",
                type: "GET",
                success: function(data) {
                    console.log("SUCCESS", data);
                }
            });*/
        },
    }
});