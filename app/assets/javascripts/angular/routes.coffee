
window.$app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'home',
        url: '/home'
        templateUrl: '/assets/home.html'
        controller: 'HomeController'

      .state "wizard",
        url: "/wizard",
        templateUrl: "/assets/wizard.html",
        controller: "WizardController"
      .state "about",
        url: '/about'
        templateUrl: "/assets/about.html"
        controller: "AboutController"
      .state "contact",
        url: '/contact'
        templateUrl: "/assets/contact.html"
        controller: "ContactController"
      .state "faq",
        url: "/faq"
        templateUrl: "/assets/faq.html"
        controller: "FaqController"
      .state "how_it_works",
        url: "/how-it-works"
        templateUrl: "/assets/how_it_works.html"
        controller: "HowItWorksController"

    $urlRouterProvider.otherwise '/home'
]


###
window.$app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "home.html"
      controller: 'HomeController'
    )
    .when('/wizard',
      templateUrl: "wizard.html"
      controller: 'WizardController'
    )
])
###