window.$app.controller "HomeController", [
  "$scope", ($scope)->
    $scope.article = { name: "Test article" }
    $scope.title = "Home"
]