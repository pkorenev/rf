app = angular.module("radok", [])
app.controller "WizardController", [
  "$scope", ($scope)->
    $scope.wizard = {}
    $scope.master = {}
    $scope.user = {}
    $scope.title = "Hello world"
    $scope.update = (user)->
      $scope.master = angular.copy(user)

    #$scope.jQuery = jQuery
    $scope.configure = ()->
      $('.configuration-steps .wizard-step:first').go_to_this_step()

    $scope.reset = ()->
      $scope.user = angular.copy($scope.master)
]