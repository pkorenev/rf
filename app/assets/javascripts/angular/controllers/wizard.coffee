#WizardTest = class WizardTest
#  @step: null
#  get_new: ()->
#    $http.get('/wizard/new_test_available_steps').success (data)->
#      angular.copy(data, @step)


#$app.factory "WizardTest", ()->


$app.controller "WizardController", [
   "$scope", "WizardTest", ( $scope, WizardTest)->

    $scope.wizard_test = WizardTest
    $scope.wizard_test.initialize()


    if window.reopen_test
      $scope.wizard_test = WizardTest.load()
    #$scope.ajax_steps = new WizardTest()
    #$scope.ajax_steps.get_new()

    #$scope.wizard = {}
    $scope.master = {}
    $scope.user = {}
    #$scope.wizard.tester_hour_price = 20
    #$scope.wizard.hours = [1, 2, 3, 4, 5]
    #$scope.wizard.selected_hour = $scope.wizard.hours[0] if !$scope.wizard.selected_hour
    #$scope.wizard.show_help = true;
    #$scope.wizard.type_of_test = false
    #$scope.wizard.total_testers_count = 0
    #$scope.wizard.ready_to_checkout = false

    #$scope.wizard.item_price = 20

    #$scope.wizard.total_price = 0

    #$scope.wizard.active_step_order_number = 1


    #$scope.wizard



    #$scope.wizard.active_step_valid = true

    ###
    $scope.wizard.steps = {
      intro: {
        type_of_test: false
        type_of_product: false
        valid: false
      }
      platforms: {
        platforms: []
        hours_per_tester: 1
        valid: false
      }
      project_information: {
        project_name: null
        project_version: null
        project_languages: []
        report_languages: []
        valid: false
      }
      test_plan: {
        type_of_test: {}
        valid: false
      }
      project_access: {
        project_auth: false
        comment: ""
        valid: false
      }
    }
    ###

    ###
    index = 0
    for step_key in $scope.wizard.steps
      index++
      $scope.wizard.steps[step_key].number = index
    ###

    ###
    $scope.wizard.named_steps = {
      preconfiguration_steps: {
        type_of_test: {
          type_of_test: false
        }
        type_of_product: {
          type_of_product: false
        }
      }
      configuration_steps: {
        hours_per_tester: 1
        
      }
    }
    ###


    $scope.wizard_test.active_step_order_number = 0
    $scope.wizard_test.active_step = $scope.wizard_test.intro_step
    #$scope.wizard_test.active_step = eq($scope.wizard_test.steps, $scope.wizard_test.active_step_order_number - 1)

    #$scope.wizard_test.next_step_order_number =

    $scope.$watch("wizard_test.active_step_order_number", (newValue)->
      new_step_number = parseInt(newValue) || 0

      if new_step_number > 1
        $scope.wizard_test.active_step.proceeded = true

      new_step_index = new_step_number - 1
      if new_step_number == 0
        $scope.wizard_test.active_step = $scope.wizard_test.intro_step
      else
        $scope.wizard_test.active_step = eq($scope.wizard_test.configuration_steps, new_step_index)


      #console.log("wizard_test.active_step_order_number: newValue: ", newValue)
      #console.log("wizard_test.active_step_order_number: $scope.wizard_test.steps.length: ", hash_length($scope.wizard_test.steps))

      $scope.wizard_test.next_step_order_number = if new_step_number && new_step_number < hash_length($scope.wizard_test.configuration_steps) then new_step_number else null
      if !$scope.wizard_test.next_step_order_number
        $scope.wizard_test.next_step = null
      else
        $scope.wizard_test.next_step = eq($scope.wizard_test.steps, $scope.wizard_test.next_step_order_number - 1)

      if new_step_number == 3
        $scope.wizard_test.active_step.valid = $scope.wizard_test.validate_step_project_info()
    )





    $scope.wizard_test.validate_step_project_info = ()->
      w = $scope.wizard_test
      if w.project_name.length > 0 && w.version_number && w.version_number.length > 0 && w.project_languages.length > 0 && w.report_languages.length > 0
        return true
      return false









    ###
    $scope.wizard_test.platforms = [
      {id: 1, name: "Browsers", svg: "ie", hours_count: 0, testers_count: 0, price: 0, comment: "", platform_subitems: [
        {name: "Internet Explorer 9", count: 0},
        { name: "Internet Explorer 10" },
        { name: "Internet Explorer 11" },
        { name: "Latest version of Firefox" },
        { name: "Latest version of Chrome" },
        { name: "Latest version of Safari" }
      ] },

      {id: 2, name: "IOS", svg: "apple", hours_count: 0, testers_count: 0, price: 0, comment: "", platform_subitems: [
        {name: "iPhone 4"},
        {name: "iPhone 5s"},
        {name: "iPad 2"},
        {name: "iPad Air"},
        {name: "iPad mini"},
        {name: "iPhone 6 Plus"}
      ]},
      {id: 3, name: "Android", hours_count: 0, testers_count: 0, price: 0, svg: "android", comment: "", platform_subitems: [
        {name: "Android phone (Samsung)"},
        {name: "Android phone (Non-Samsung)"},
        {name: "Android tablet (Samsung)"}
        {name: "Android tablet (Non-Samsung)"}
      ]}
    ]
    ###





    watch_platforms = ()->
      #console.log("watch_platforms()", $scope.wizard_test.platforms)

      for platform_key, platform of $scope.wizard_test.platforms
        #console.log("for: #{platform_key}", platform)
        for ps, j in platform.subitems
          #console.log("$watch: -------- wizard_test.platforms.#{platform_key}.subitems[#{j}].count")
          $scope.$watch("wizard_test.platforms.#{platform_key}.subitems[#{j}].count", (newValue, oldValue)->
            newValue = parseInt(newValue) || 0
            oldValue = parseInt(oldValue) || 0
            difference = newValue - oldValue
            $scope.wizard_test.total_testers_count = $scope.wizard_test.total_testers_count + difference

            if newValue > 0
              $scope.wizard_test.platforms[newValue]


            for inner_platform_key, inner_platform of $scope.wizard_test.platforms
              platform_price = 0
              platform_testers_count = 0
              for inner_ps in inner_platform.subitems
                platform_price += (parseInt(inner_ps.count) || 0) * $scope.wizard_test.item_price * $scope.wizard_test.selected_hour
                platform_testers_count += parseInt(inner_ps.count)
              inner_platform.price = platform_price
              inner_platform.testers_count = platform_testers_count
              inner_platform.hours_count = platform_testers_count * $scope.wizard_test.selected_hour


            #difference = newValue - oldValue

            #p = $scope.wizard_test.platforms[platform_key]
            #platform_price = p.price + $scope.wizard_test.item_price * difference * parseInt($scope.wizard_test.selected_hour)
            #p.price = platform_price
          )

        $scope.$watch("wizard_test.platforms.#{platform_key}.price", (newValue, oldValue)->
          difference = newValue - oldValue
          #alert("change platform price:\nplatform_index: #{platform_key}\nnewValue: #{newValue}\noldValue: #{oldValue}")
          $scope.wizard_test.total_price = $scope.wizard_test.total_price + difference
        )

      $scope.$watch("wizard_test.total_price", (newValue)->
        $scope.wizard_test.configuration_steps.platforms.valid = newValue > 0
      )

      $scope.$watch("wizard_test.selected_hour", (newValue, oldValue)->
        if $scope.wizard_test.platforms
          for platform_key, platform of $scope.wizard_test.platforms
            platform.price = platform.price / (oldValue) * newValue
            platform.hours_count = platform.testers_count * newValue
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







    $scope.wizard_test.available_project_languages = ["English", "Ukrainian", "Russian", "Portuguese", "Polish"]
    $scope.wizard_test.available_report_languages = ["English", "Ukrainian", "Russian", "Portuguese", "Polish"]


    $scope.wizard_test.tested_before = 'no' #false
    $scope.wizard_test.project_name ?= "Project 1"
    $scope.wizard_test.version_number = null
    $scope.wizard_test.project_languages = []
    $scope.wizard_test.project_languages_count = 0
    $scope.wizard_test.report_languages = []
    $scope.wizard_test.report_languages_count = 0
    $scope.wizard_test.methodology_id = 1

    $scope.wizard_test.available_methodology_types = [
      {id: 1, type: "exploratory", description: "", description_placeholder: "Please provide testing instructions for the testers here..."}
      {id: 2, type: "Test-case driven", description: "", description_placeholder: "Please provide testing instructions for the testers here..."}
    ]



    $scope.wizard_test.product_main_components = []

    $scope.wizard_test.url = null
    $scope.wizard_test.auth_data = {
      username: ""
      password: ""
      require_auth: "false"
    }
    $scope.wizard_test.comment = ""




    for field_name in ["project_name", "version_number", "project_languages", "report_languages", "project_languages_count", "report_languages_count"]
      console.log("bind watch on wizard_test.#{field_name}" )
      $scope.$watch("wizard_test.#{field_name}", (newValue, oldValue)->
        console.log("triggered whatch on wizard_test.#{field_name}: old: #{oldValue}; new: #{newValue}")
        if $scope.wizard_test.active_step_order_number == 3
          $scope.active_step = eq($scope.wizard_test.steps, $scope.wizard_test.active_step_order_number - 1 )

          if $scope.active_step
            $scope.wizard_test.active_step.valid = $scope.wizard_test.validate_step_project_info()
          eq($scope.wizard_test.steps, 2).valid = $scope.wizard_test.validate_step_project_info()
      )


    for field_name in ["project_languages", "report_languages"]
      console.log("bind watch on wizard_test.#{field_name}" )
      $scope.$watchCollection("wizard_test.#{field_name}", (newValue, oldValue)->
        console.log("watchCollection")
        console.log("triggered whatchCollection on wizard_test.#{field_name}: old: #{oldValue}; new: #{newValue}")
        if $scope.wizard_test.active_step_order_number == 3
          $scope.active_step ?= eq($scope.wizard_test.steps, $scope.wizard_test.active_step_order_number - 1)
          $scope.wizard_test.active_step.valid = $scope.wizard_test.validate_step_project_info()
          eq($scope.wizard_test.steps, 2).valid = $scope.wizard_test.validate_step_project_info()
      )

    $scope.update = (user)->
      $scope.master = angular.copy(user)

    #$scope.jQuery = jQuery
    $scope.configure = ()->
      $scope.wizard_test.configuration_steps = {}
      for step_key, step of $scope.wizard_test.available_steps
        if step_key == 'test_plan' && $scope.wizard_test.intro_step.type_of_test == 'functional'
          continue
        else
          $scope.wizard_test.configuration_steps[step_key] = step



      $('.configuration-steps').removeClass("hide").addClass("visible")
      $('.intro-step').addClass("proceeded")
      #$('.configuration-steps .wizard_test-step:first').go_to_this_step()
      $scope.wizard_test.configure_mode = true
      #$('.configuration-steps').removeClass()
      $scope.wizard_test.show_mini_summary = true
      $scope.wizard_test.show_help = false
      $scope.wizard_test.active_step_order_number = 1
      #$scope.wizard_test.configure_mode_class = ()->
      #$scope.wizard_test.available_platforms = WizardTest.load_platforms($scope.wizard_test.product_type).platforms

      promise = $scope.wizard_test.load_platforms($scope.wizard_test.intro_step.type_of_product)
      promise.then ()->

        watch_platforms()







    $scope.$watch("wizard_test.active_step_order_number", (newValue, oldValue)->
      #$new_step = angular.element("[step-id=#{newValue}]")
      console.log("active_step_order_number changed: new: #{newValue}; old: #{oldValue};")

      $new_step = jQuery("[step-id=#{newValue}]")
      #console.log("new_step: ", $new_step)
      if $new_step.length
        scroll_to_top = $new_step.offset().top - 80
        #console.log("step: #{scroll_to_top}")
        jQuery("#body").animate(scrollTop: scroll_to_top)

      ###
      setTimeout( ()->

      , 1000)
      ###
    )


    $scope.wizard_test.ready_go_to_step = (step_id)->
      step_id = parseInt(step_id)
      if (parseInt($scope.wizard_test.active_step_order_number) > step_id) || ($scope.wizard_test.active_step &&  $scope.wizard_test.active_step.valid && parseInt($scope.wizard_test.active_step_order_number) < step_id)
        if $scope.wizard_test.active_step_order_number < step_id
          prev_step = $scope.wizard_test.steps.filter( (s)-> parseInt(s.id) == step_id   )[0]
          if prev_step && prev_step.valid
            return true
          else
            return false

        return true


    $scope.wizard_test.go_to_step = (step_id)->
      step_id = parseInt(step_id)
      if (parseInt($scope.wizard_test.active_step_order_number) > step_id) || ($scope.wizard_test.active_step &&  $scope.wizard_test.active_step.valid && parseInt($scope.wizard_test.active_step_order_number) < step_id)
        if $scope.wizard_test.active_step_order_number < step_id
          prev_step = $scope.wizard_test.steps.filter( (s)-> parseInt(s.id) == step_id   )[0]
          if prev_step && prev_step.valid
            $scope.wizard_test.active_step.proceeded = true
          else
            return false

        $scope.wizard_test.active_step_order_number = step_id

    $scope.go_back = ()->
      $scope.wizard_test.active_step_order_number = $scope.wizard_test.active_step_order_number - 1

    $scope.next_question = ()->
      $('.next-question-button').removeClass("visible").addClass('hide')
      $question = $('.wizard-step').first().find(".question").eq(1)
      question_top = $question.offset().top

      top_to_animate = question_top - $('#header').height() - 48
      $('#body').animate({scrollTop: top_to_animate})

    $scope.next_step = ()->
      if $scope.wizard_test.active_step.valid
        $scope.wizard_test.active_step.proceeded = true
        $scope.wizard_test.active_step_order_number = $scope.wizard_test.active_step_order_number + 1




    $scope.reset = ()->
      $scope.user = angular.copy($scope.master)
]