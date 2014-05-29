'use strict'

angular.module('uarmApp')
  .controller 'ServoCtrl', ($scope, SocketService) ->
  	$scope.$on "servo.1", (data) =>
  		console.info("Received" + data);
    $scope.value = 50