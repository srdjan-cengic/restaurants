RestaurantsBa.CouponesController = Ember.ArrayController.extend({
    
    


    actions: {
          all: function(){
            var self = this;
        
            $.ajax({
                type: "GET",
                url: "api/coupones/search.json?description="+this.get("description"),
                data: {
                    
                },
                success: function(data) {
                    self.set('content',data.coupones);
                    
                },
                error: function(jqXHR, textStatus, errorThrown) {
                }
            });
        },
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