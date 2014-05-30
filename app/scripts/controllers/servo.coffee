'use strict'

angular.module('uarmApp')
  .controller 'ServoCtrl', ($scope, SocketService, $rootScope) =>
    $scope.data = 10;
    $scope.max = 600; 
    
    $scope.knobOptions = {
      'width':75,
      'change': (value) =>
        $rootScope.$emit("servo.command",  $scope.servo.id + ":" + value);
    };

    $rootScope.$on "servo." + $scope.servo.id, (event, message) =>
      $scope.data = message;

