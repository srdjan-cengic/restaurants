// Ti vec u trenutnku kada si na templejtu (login.hbs) uradio
// valueBinding="email" i valueBinding="password" na kontroleru
// su dodani Own propertiesi: email i password
// http://pokit.org/get/?97d6c5e9b355f7da53daa7ceb925d0a3.jpg
// to se sve vec desilo a da nisi manuleno napravio kontroler u uopste
// imao si this.route("login"); i login.hbs i nista vise
RestaurantsBa.ProfilController = Ember.Controller.extend({
    isFailed: false,
    currentUser: null,
    setCurrentUser: function(user) {
        if (typeof user === "undefined") this.set("currentUser", null);
        else this.set("currentUser", user);
    },

});