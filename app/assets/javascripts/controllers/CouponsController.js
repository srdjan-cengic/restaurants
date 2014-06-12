RestaurantsBa.CouponsController = Ember.ArrayController.extend({
    
   

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
      
        deleteCoupon: function(coupone) {
            if (window.confirm("Are you sure you want to delete this coupon?")) {

                var coupone_id = coupone.get('id');
                var controller = this;

                $.ajax({
                    type: "DELETE",
                    url: "api/coupones/" + coupone_id + "/",
                    success : function(data) {          
                        controller.removeObject(coupone);                    
                    }, 
                    error: function() {
                        alert("Delete failed");
                    }             
                });
            }
        }
    }
});