RestaurantsBa.Router.map(function() {
    // Passing the name of the template => By that "registration.hbs" becomes
    // the template that is render when we visit localhost:3000/#/registration
    this.route("registration");
    this.resource("restaurants", function() {
        this.route("new");
     });

    this.resource("restaurants_new");
    
    this.resource("coupones", {
        path: "/coupones"
    }, function() {
        this.route("new", {
            path: "/new"
        });
    });
});