'use strict'

angular.module('uarmApp')
  .controller 'ServoCtrl', ($scope, SocketService, $rootScope) =>
    $scope.data = 10;
    $scope.max = 600; 
    
    $scope.knobOptions = {
      'width':75,
    };

    $rootScope.$on "servo." + $scope.servo.id, (event, message) =>

      console.info(message);
      $scope.data = message;
    
    