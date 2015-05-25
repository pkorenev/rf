window.$app.controller "HomeController", [
  "$scope", ($scope)->
    $scope.title = "Home"

    $scope.home_slides = [
      {title: "We test mobile, web apps, and games.", description: "1500+ certified testers ready to start testing your product immediately."}
    ]

    $scope.how_it_works_items = [
      {img: "/assets/rf-mobile-apps.svg", title: "Tell us that you need to test", time: "Takes less than 10 minutes!", description: "Choose the type of testing you need, amount of hours spent, number of people involved, and platforms you want your product be tested on. No sign-up or credit card needed. Takes 3 minutes."}
      {img:"/assets/rf-mobile-apps.svg", title: "Submit your request", time: "2-3 minutes", description: "Submit your request and sit back enjoying our engineers do everything else! Our team of 1500+ testing professionals are ready to start immediately."}
      {img: "/assets/rf-mobile-apps.svg", title: "Get rapid results", time: "48 hours", description: "In up to 48 hours, you will receive a detailed bug report with test cases carefully documented. In some cases, we would even get the work done overnight."}
    ]

    $scope.what_for_you = {
      title: "What’s in it for you?", items: [
        "Get results fast - in 48 hours!"
        "No time wasted on a bunch of freelancers, each able to test only on a couple of platforms;"
        "Have your product tested on all the needed platforms, don’t miss anything;"
        "You get a service only by certified professionals."
      ]
    }

    $scope.statistics = {
      title: "Need some statistic?"
      tested_projects_count: 143
      testers_count: 1981
    }


    $scope.feedbacks = [
      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
    ]

    $scope.who_we_are_best_for = {
      title: "Who we are best for:", items: [
        "Startups that need to test their products before a release;"
        "Product companies that don’t have QA engineers in-house;"
        "Product owners or individual freelancers to test their product."
      ]
    }

    $scope.benefits = {
      title: "Benefits:", items: [
        "We deliver results in 48 hours!"
        "1500+ professional certified QA engineers;"
        "we test on all platforms, we mean it, all (we have access to every hardware device manufactured in the last 5 years);"
        "our customers support works 24/7."
      ]
    }


]