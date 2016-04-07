angular.module('genericOrderingSystem')
  .factory('auth',['$http',function($http){
    var o = {
      auth: []
    };

    o.create = function(request){
    	return $http.post('').success(function(data){
    		o.auth.push(data);
    	});
    };
    return o;
  }])