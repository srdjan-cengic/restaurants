# for more details see: http://emberjs.com/guides/models/defining-models/

RestaurantsBa.Vote = DS.Model.extend
  voteType: DS.attr 'string'
  restaurantId: DS.attr 'number'
  userId: DS.attr 'number'
