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
      
    $scope.openedDropdown = ()->
      #$this = angular.element(this)
      #return $this.data("opened") == true
      return $scope.dropdown_opened

    $scope.dropdown_opened = false

    $scope.openedDropdownClass = ()->
      opened = $scope.openedDropdown.apply(this)
      if opened
        return "opened"
      else
        return ""



    $scope.openDropdown = ()->
      #$this = angular.element(this)
      #$this.data("opened", true)
      $scope.dropdown_opened = true

    $scope.toggleDropdown = ()->
      $scope.dropdown_opened = !$scope.dropdown_opened

    $scope.menu_items = [
      {title: "For clients", subitems: [
        {title: "Testing services", sref: ""}
        {title: "Pricing", sref: ""}
        {title: "FAQ", sref: "faq"}
      ]}
      {title: "How it works", sref: "how_it_works"}
      {title: "About us", sref: "about"}
      {title: "Contact us", sref: "contact"}
    ]


]
