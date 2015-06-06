window.$app.controller "ContactController", [
  "$scope", "$http", ($scope, $http)->
    $scope.title = "Contact us"
    $scope.contact_request = {
      subject: ""
      name: ""
      email: ""
      description: ""
    }

    $scope.page_banner = {
      title: "Contact page header"
      description: "Type few works about this page"
      image: '/assets/banners/contacts.jpg'
    }

    $scope.submitRequest = ()->
      deffered = $http.post("/contact_request", $scope.contact_request)
      deffered.success (data)->
        if data.code == 200
          alert("success")
        else
          alert("error")
      deffered.error ()->
        alert("deffered error")
]