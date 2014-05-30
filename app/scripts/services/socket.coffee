'use strict'

angular.module('uarmApp')
  .service 'SocketService', (@$rootScope) =>
    url = 'http://localhost:9000'
    @client =  io.connect(url);
    

    servos = (num for num in [1..6])
    for servo_index in servos then do =>
      key = 'servo.' + servo_index
      @client.on key, (data)  => 
        @$rootScope.$apply =>
          @$rootScope.$broadcast(key, data);

    @$rootScope.$on 'servo.command', (event, value) =>
      @client.emit('servo.command', value);

      