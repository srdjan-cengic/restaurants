// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require docs.min
//= require raphael
//= require morris
//= require handlebars
//= require ember
//= require ember-data

//= require_self
//= require restaurants_ba

// for more details see: http://emberjs.com/guides/application/
RestaurantsBa = Ember.Application.create();

RestaurantsBa.MapView = Ember.ContainerView.extend({

  id: 'map-canvas',
  tagName: 'div',

  attributeBindings: ['style'],
  style:"height: 200px; ",
  
  map:null,

  didInsertElement: function() {
    var mapOptions = {
      center: new google.maps.LatLng(28.405765,77.049479),
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(this.$().get(0),mapOptions);
    this.set("map",map);
  }
});