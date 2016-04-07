angular.module('genericOrderingSystem', ['ui.router', 'templates'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_index.html',
      controller: 'Homes'
    })
    .state('login', {
      url: '/login',
      templateUrl: 'auth/_login.html',
      controller: 'Authentications'
    });
  $urlRouterProvider.otherwise('/login');
}])
