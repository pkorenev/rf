window.$app.controller "ProfileController", [
  "$scope", "$http", ($scope, $http)->

    $scope.active_tab_index = 0

    $scope.personal_data = {
      name: ""
      phone_number: ""
      email: ""
      billing_address: ""
      city: ""
      zip_code: null
      country: ""
    }

]