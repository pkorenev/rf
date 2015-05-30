$app.controller 'NavigationController', [
  '$scope'
  '$location'
  "Auth"
  "ngDialog"
  ($scope, $location, Auth, ngDialog) ->

#    $scope.navClass = (page) ->
#      currentRoute = $location.path().substring(1) or 'home'
#      if page == currentRoute then 'active' else ''

    #$items_with_dropdown = angular.element(".header-menu-item.has-dropdown")
    #console.log("items.count: #{$items_with_dropdown.length}")
#    $items_with_dropdown.bind "click", (event)->
#      console.log("menu item with dropdown: click")
#      event.preventDefault()
      
#    $scope.openedDropdown = ()->
#      #$this = angular.element(this)
#      #return $this.data("opened") == true
#      return $scope.dropdown_opened

    #$scope.dropdown_opened = false

#    $scope.openedDropdownClass = ()->
#      opened = $scope.openedDropdown.apply(this)
#      if opened
#        return "opened"
#      else
#        return ""



#    $scope.openDropdown = ()->
#      #$this = angular.element(this)
#      #$this.data("opened", true)
#      $scope.dropdown_opened = true

#    $scope.toggleDropdown = ()->
#      $scope.dropdown_opened = !$scope.dropdown_opened



    unlogged_user_menu = [
      {title: "For clients", subitems: [
        {title: "Testing services", sref: ""}
        {title: "Pricing", sref: ""}
        {title: "FAQ", sref: "faq"}
      ]}
      {title: "How it works", sref: "how_it_works"}
      {title: "About us", sref: "about"}
      {title: "Contact us", sref: "contact"}
    ]

    logged_user_menu = [
      {title: "My dashboard"}
      {title: "For clients", subitems: [
        {title: "Testing services", sref: ""}
        {title: "How it works", sref: "how_it_works"}
        {title: "Pricing", sref: ""}
        {title: "FAQ", sref: "faq"}
      ]}
      {title: "About us", sref: "about"}
      {title: "Contact us", sref: "contact"}
    ]

    $scope.menu_items = unlogged_user_menu

    $scope.$watch("logged_in", (newValue)->
      if newValue
        $scope.menu_items = logged_user_menu
      else
        $scope.menu_items = unlogged_user_menu
    )



    $scope.logged_in = false

    Auth.currentUser().then(
      (user)->
        $scope.logged_in = true
    )

    $scope.headerUserClass = ()->

      if $scope.logged_in
        logged_in_class = "logged-in"
      else
        logged_in_class = "unlogged"

      no_avatar_class = "no-avatar"

      return "#{logged_in_class} #{no_avatar_class}"

    $scope.show_user_dropdown = false

    $scope.showUserDropdown = ()->
      $scope.show_user_dropdown = true
    $scope.closeUserDropdown = ()->
      $scope.show_user_dropdown = false
    $scope.toggleUserDropdown = ()->
      $scope.show_user_dropdown = !$scope.show_user_dropdown

    $scope.logoutUser = ()->
      Auth.logout(
        (oldUser)->
          console.log("logged_out, user: ", oldUser)
          $scope.logged_in = false
          $scope.$update()
        (error)->
      )

    $scope.$on('devise:logout', (event, oldCurrentUser) ->
      $scope.logged_in = false
    )

    $scope.openSignInDialog = ()->
      ngDialog.open({
        template: '/assets/popups/sign_in.html'
        className: 'ngdialog-theme-default ngdialog-theme-rf-light-gray'
        controller: "SignInController"
        preCloseCallback: (result)->
          Auth.currentUser().then(
            (user)->

              $scope.logged_in = true

          )
      });

]
