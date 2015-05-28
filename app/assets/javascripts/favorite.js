var app = angular.module('storedom', []);

app.service("BackendService", function($http) {
  this.addFavorite = function(item_id) {
    return $http.post('/favorites', { item_id: item_id })
  }
  this.deleteFavorite = function(item_id, add_or_remove) {
    return $http.delete('/favorites/' + item_id)
  }
  this.getFavorites = function() {
    return $http.get('/favorites.json')
  }
});

app.controller("FavoritesController", function($scope, BackendService) {
  $scope.favorites = [];
  $scope.fillFavorites = function() {
    BackendService.getFavorites()
    .then(function(success) {
      var favorites = success.data
      var fav_ids = favorites.map(function(elem) {
          return elem.item_id
      });
      $scope.favorites = fav_ids;
    })
  }

  $scope.showRemove = function (item_id) {
    return $scope.favorites.indexOf(item_id) === -1
  }

  $scope.addFavorite = function(item_id) {
    BackendService.addFavorite(item_id)
    .then(function(success) {
      $scope.favorites.push(item_id)
    });
  }

  $scope.removeFavorite = function(item_id) {
    BackendService.deleteFavorite(item_id)
    .then(function(success) {
      var index = $scope.favorites.indexOf(item_id);
      $scope.favorites.splice(index, 1);
    })
  }
});

