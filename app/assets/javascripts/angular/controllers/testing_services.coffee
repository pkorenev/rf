window.$app.controller "TestingServicesController", [
  "$scope", "$auth", "ngDialog", ($scope, Auth, ngDialog)->
    $scope.title = "How it works"

    $scope.ctrl = 'testing_services'

    # test types
    $scope.three_images_in_row_model = [
      {img: "/assets/rf-icon-main-1.svg", title: "Functional testing", time: "apps | web | games", description: "Choose the type of testing you need, amount of hours spent, number of people involved, and platforms you want your product be tested on. No sign-up or credit card needed. Takes 3 minutes."}
      {img:"/assets/rf-icon-main-2.svg", title: "Localization testing", time: "apps | web | games", description: "Submit your request and sit back enjoying our engineers do everything else! Our team of 1500+ testing professionals are ready to start immediately."}
      {img: "/assets/rf-icon-main-3.svg", title: "Usability testing", time: "apps | web | games", description: "In up to 48 hours, you will receive a detailed bug report with test cases carefully documented. In some cases, we would even get the work done overnight."}
    ]


    # what we test
    $scope.two_horizontal_items_per_row_model = [
      {img: '/assets/rf-mobile-apps.svg', title: "Mobile apps", description: 'I am greatly pleased with the experience with Radok Force. I have contacted them to get a functional and usability testing before a release of our peace of software. The reports guys created were very professional and did exceed my expectations, and also they caught a number of bugs we missed internally. Our release was so much smoother thanks to Radok Force.'}

      {img: '/assets/rf-responsive.svg', title: "Responsive websites", description: 'I am greatly pleased with the experience with Radok Force. I have contacted them to get a functional and usability testing before a release of our peace of software. The reports guys created were very professional and did exceed my expectations, and also they caught a number of bugs we missed internally. Our release was so much smoother thanks to Radok Force.'}

      {img: '/assets/rf-software.svg', title: "Software", description: 'I am greatly pleased with the experience with Radok Force. I have contacted them to get a functional and usability testing before a release of our peace of software. The reports guys created were very professional and did exceed my expectations, and also they caught a number of bugs we missed internally. Our release was so much smoother thanks to Radok Force.'}

      {img: '/assets/rf-games.svg', title: "Games", description: 'I am greatly pleased with the experience with Radok Force. I have contacted them to get a functional and usability testing before a release of our peace of software. The reports guys created were very professional and did exceed my expectations, and also they caught a number of bugs we missed internally. Our release was so much smoother thanks to Radok Force.'}
    ]

    $scope.reasons = [
      {name: "Instantaneity", description: "Thousands of experienced software testers are available to test your products on a moment's noticeblication."}
      {name: "Professional testers", description: "Thousands of experienced software testers are available to test your products on a moment's noticeblication."}
      {name: "Real-world testing", description: "Thousands of experienced software testers are available to test your products on a moment's noticeblication."}
      {name: "Flexibility", description: "Thousands of experienced software testers are available to test your products on a moment's noticeblication."}
    ]

]