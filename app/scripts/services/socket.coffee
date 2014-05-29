'use strict'

angular.module('uarmApp')
  .service 'SocketService', (@$rootScope) =>
    constructor: ->
			url = 'http://localhost:9000'
			@client =  io.connect(url);
			servos = (num for num in [1..6])
			for servo_index in servos then do =>
				key = 'servo.' + servo_index
				@client.on key, (data)  =>
					@$rootScope.$broadcast(key, data);