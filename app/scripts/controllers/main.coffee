'use strict'

angular.module('uarmApp')
  .controller 'MainCtrl', ($scope) =>
    $scope.servos = [
      {
        id: 1,
        name: 'shoulder'
      },
      {
        id: 2,
        name: 'elbow'
      },
      {
        id: 3,
        name: 'platform'
      },
      {
        id: 4,
        name: 'wrist'
      }
    ];