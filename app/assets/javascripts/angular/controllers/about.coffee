window.$app.controller "AboutController", [
  "$scope", "Leader", ($scope, Leader)->
    $scope.title = "About us"
    $scope.leaders = Leader
    $scope.leaders.load_leaders()

]