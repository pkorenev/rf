$app.controller 'NavigationController', [
  '$scope'
  '$location'
  ($scope, $location) ->

    $scope.navClass = (page) ->
      currentRoute = $location.path().substring(1) or 'home'
      if page == currentRoute then 'active' else ''

    $items_with_dropdown = angular.element(".header-menu-item.has-dropdown")
    console.log("items.count: #{$items_with_dropdown.length}")
    $items_with_dropdown.bind "click", (event)->
      console.log("menu item with dropdown: click")
      event.preventDefault()



]
