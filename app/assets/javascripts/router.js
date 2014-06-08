RestaurantsBa.Router.map(function() {
    // Passing the name of the template => By that "registration.hbs" becomes
    // the template that is render when we visit localhost:3000/#/registration
    this.route("search");
    this.route("registration");
    this.route("login");
    this.route("profil");
    this.route("my_restaurant");

    this.resource("restaurants", function() {
        this.resource("restaurant", {
            'path': '/:restaurant_id'
        });
        this.route("new");
    });

    //this.resource('restaurant', { path: '/restaurants/:id' });
    this.resource("restaurants_new");
    this.resource("maps");

    this.resource("coupones", { path: "/coupones" });
    this.resource("coupones_new");
});