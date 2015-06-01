window.$app.controller "DashboardController", [
  "$scope", "Auth", "ngDialog", "$timeout", ($scope, Auth, ngDialog, $timeout)->
    $scope.title = "How it works"

    $scope.range = (n)->
      arr = []
      i = 0
      while i < n
        arr[i] = i+1
        i++
      return arr



    $scope.drafts = [
      {
        project_name: "Project name #1233322"
        steps_completed: [4,7]
        type_of_test: "Functional testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: 18
        total_testers_count_string: "18 testers"
        hours_per_tester: 2
      }
      {
        project_name: "My project 2"
        steps_completed: [1,7]
        type_of_test: "Localization testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: null
        total_testers_count_string: "Not specified"
        hours_per_tester: 1
      }
      {
        project_name: "My project 3"
        steps_completed: [6,7]
        type_of_test: "Usability testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: 3
        total_testers_count_string: "3 testers"
        hours_per_tester: 5
      }

      {
        project_name: "Project name #1233322"
        steps_completed: [4,7]
        type_of_test: "Functional testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: 18
        total_testers_count_string: "18 testers"
        hours_per_tester: 2
      }
      {
        project_name: "My project 2"
        steps_completed: [1,7]
        type_of_test: "Localization testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: null
        total_testers_count_string: "Not specified"
        hours_per_tester: 1
      }
      {
        project_name: "My project 3"
        steps_completed: [6,7]
        type_of_test: "Usability testing"
        type_of_test_logo: "/assets/rf-icon-functional-test.svg"
        type_of_test_icon: "/assets/rf-icon-test-type.svg"
        testing_type: "Exploratory"
        total_testers_count: 3
        total_testers_count_string: "3 testers"
        hours_per_tester: 5
      }
    ]

    $scope.in_progress_tests = [
      {
        project_name: "Project name 4"
        percent_completed: 25
        timespan_left: "2 days"
      }
      {
        project_name: "Project name 5"
        percent_completed: 25
        timespan_left: "2 days"
      }
      {
        project_name: "Project name 6"
        percent_completed: 25
        timespan_left: "2 days"
      }
    ]

    for test in $scope.in_progress_tests
      test.percent_completed_counter = 0

    $scope.start_in_progress_timers = ()->
        timer = $timeout(
          ()->
            need = false
            for test in $scope.in_progress_tests
              console.log("hello")
              test.percent_completed_counter = test.percent_completed_counter + 1
              if !need
                need = test.percent_completed_counter < test.percent_completed
            if(need)
              $scope.start_in_progress_timers()

          50
        )

    $scope.start_in_progress_timers()



#    for test in $scope.in_progress_tests
#      #alert(test.percent_completed_counter)
#      timer = $timeout (
#        ()->
#          console.log("hello")
#          #test.percent_completed_counter = test.percent_completed_c + 1
#        100
#      )
      #test.percent_completed_counter = 0

    $scope.finished_projects = [
      {project_name: "Project name 7", project_status: true}
      {project_name: "Project name 8", project_status: true}
      {project_name: "Project name 9", project_status: true}
      {project_name: "Project name 10", project_status: true}
      {project_name: "Project name 11", project_status: true}
      {project_name: "Project name 12", project_status: true}
      {project_name: "Project name 13", project_status: true}
      {project_name: "Project name 14", project_status: false}
      {project_name: "Project name 15", project_status: true}
      {project_name: "Project name 16", project_status: true}
      {project_name: "Project name 17", project_status: true}
      {project_name: "Project name 18", project_status: true}
      {project_name: "Project name 19", project_status: true}
      {project_name: "Project name 20", project_status: true}

    ]

]