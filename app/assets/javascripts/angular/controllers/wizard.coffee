window.$app.controller "WizardController", [
  "$scope", ($scope)->

    $scope.selected_test_type = "functional"
    $scope.wizard = {}
    $scope.master = {}
    $scope.user = {}
    $scope.title = "Wizard"
    $scope.wizard.tester_hour_price = 20
    $scope.wizard.hours = [1, 2, 3, 4, 5]
    $scope.wizard.selected_hour = $scope.wizard.hours[0] if !$scope.wizard.selected_hour
    $scope.wizard.show_help = true;
    $scope.wizard.type_of_test = false

    $scope.wizard.item_price = 20

    $scope.wizard.total_price = 0

    $scope.wizard.active_step_id = 1
    #$scope.wizard
    $scope.next_step_id = 2

    $scope.wizard.active_step_valid = true

    $scope.wizard.steps = [
      {id: 1, intro: true}
      {id: 2, name: "Step A name", number: 1, valid: true}
      { id: 3, name: "step B name", number: 2, valid: true }
      { id: 4, name: "step C name", number: 3, valid: true }
    ]

    $scope.$watch("wizard.active_step_id", (newValue)->
      $scope.wizard.active_step = $scope.wizard.steps.filter( (s)->
        s.id == newValue
      )[0]

      $scope.wizard.next_step_id = newValue + 1
      $scope.wizard.next_step = $scope.wizard.steps.filter( (s)->
        s.id == $scope.wizard.next_step_id
      )[0]
    )

    $scope.$watch("wizard.total_price", (newValue)->
      $scope.wizard.steps[1].valid = newValue > 0
    )






    $scope.wizard.platforms = [
      {id: 1, name: "Browsers", svg: "ie", price: 0, platform_subitems: [
        {name: "Internet Explorer 9", count: 0},
        { name: "Internet Explorer 10" },
        { name: "Internet Explorer 11" },
        { name: "Latest version of Firefox" },
        { name: "Latest version of Chrome" },
        { name: "Latest version of Safari" }
      ] },

      {id: 2, name: "IOS", svg: "apple", price: 0, platform_subitems: [
        {name: "iPhone 4"},
        {name: "iPhone 5s"},
        {name: "iPad 2"},
        {name: "iPad Air"},
        {name: "iPad mini"},
        {name: "iPhone 6 Plus"}
      ]},
      {id: 3, name: "Android", price: 0, svg: "android", platform_subitems: [
        {name: "Android phone (Samsung)"},
        {name: "Android phone (Non-Samsung)"},
        {name: "Android tablet (Samsung)"}
        {name: "Android tablet (Non-Samsung)"}
      ]}
    ]





    for p, i in $scope.wizard.platforms
      for ps, j in p.platform_subitems
        $scope.$watch("wizard.platforms[#{i}].platform_subitems[#{j}].count", (newValue, oldValue)->
          difference = newValue - oldValue
          platform_price = p.price + $scope.wizard.item_price * difference
          p.price = platform_price
        )

      $scope.$watch("wizard.platforms[#{i}].price", (newValue, oldValue)->
        difference = newValue - oldValue
        #alert("change platform price:\nplatform_index: #{i}\nnewValue: #{newValue}\noldValue: #{oldValue}")
        $scope.wizard.total_price = $scope.wizard.total_price + difference
      )
    ###
    $scope.step_3_questions = [
      question: "Have you ever tested this project with us?"
      type: "radio"
      options: [
        {
          label: "Yes, we tested a previous version of this project"
          value: "yes"
        }
        {
          label: "No, this is a completely new project"
        }
      ]
    ]
    ###





    for p in $scope.wizard.platforms
      for item in p.platform_subitems
        if !item.count
          item.count = 0

    $scope.wizard.available_project_languages = ["English", "Ukrainian", "Russian", "Portuguese", "Polish"]
    $scope.wizard.available_report_languages = ["English", "Ukrainian", "Russian", "Portuguese", "Polish"]


    $scope.wizard.tested_before = 'no' #false
    $scope.wizard.project_name = null
    $scope.wizard.version_number = null
    $scope.wizard.project_languages = []
    $scope.wizard.report_languages = []
    $scope.wizard.methodology_id = 1

    $scope.wizard.available_methodology_types = [
      {id: 1, type: "exploratory", description: "", description_placeholder: "Please provide testing instructions for the testers here..."}
      {id: 2, type: "Test-case driven", description: "", description_placeholder: "Please provide testing instructions for the testers here..."}
    ]



    $scope.wizard.product_main_components = []

    $scope.wizard.url = null
    $scope.wizard.auth_data = false
    $scope.wizard.comment = ""





    $scope.update = (user)->
      $scope.master = angular.copy(user)

    #$scope.jQuery = jQuery
    $scope.configure = ()->
      $('.configuration-steps').removeClass("hide").addClass("visible")
      $('.intro-step').addClass("proceeded")
      #$('.configuration-steps .wizard-step:first').go_to_this_step()
      $scope.wizard.configure_mode = true
      #$('.configuration-steps').removeClass()
      $scope.wizard.show_mini_summary = true
      $scope.wizard.show_help = false
      $scope.wizard.active_step_id = 2
      #$scope.wizard.configure_mode_class = ()->






    $scope.$watch("wizard.active_step_id", (newValue, oldValue)->
      #$new_step = angular.element("[step-id=#{newValue}]")
      #console.log("active_step_id changed: new: #{newValue}; old: #{oldValue}")

      $new_step = jQuery("[step-id=#{newValue}]")
      console.log("new_step: ", $new_step)
      scroll_to_top = $new_step.offset().top - 80
      console.log("step: #{scroll_to_top}")
      jQuery("#body").animate(scrollTop: scroll_to_top)

      ###
      setTimeout( ()->

      , 1000)
      ###
    )

    $scope.next_question = ()->
      $('.next-question-button').removeClass("visible").addClass('hide')
      $question = $('.wizard-step').first().find(".question").eq(1)
      question_top = $question.offset().top

      top_to_animate = question_top - $('#header').height() - 48
      $('#body').animate({scrollTop: top_to_animate})

    $scope.next_step = ()->
      if $scope.wizard.active_step.valid
        $scope.wizard.active_step_id = $scope.wizard.active_step_id + 1


    $scope.reset = ()->
      $scope.user = angular.copy($scope.master)
]