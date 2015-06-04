window.$app.controller "PricingController", [
  "$scope", "$auth", "ngDialog", ($scope, Auth, ngDialog)->
    $scope.title = "How it works"

    $scope.ctrl = 'pricing'


    $scope.feedbacks = [
#      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
#      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
#      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
#      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
#      {text: "Being in the software industry requires constant functional and usability testing. I have to say Radok Force time/quality ratio of reports are a must have.", name: "Victor Shevchenko", position: "Company CEO"}
      {text: "I am greatly pleased with the experience with Radok Force. I have contacted them to get a functional and usability testing before a release of our peace of software. The reports guys created were very professional and did exceed my expectations, and also they caught a number of bugs we missed internally. Our release was so much smoother thanks to Radok Force.", name: "Google", image: {src: "/assets/google2.svg", maxWidth: '180px', maxHeight: '70px'}}
      {text: "We have involved Radok in testing our mobile app for localisation. We all at [company name] were impressed with the testing team’s in-depth knowledge and system approach. Besides, we got results in less than 2 days! Without any hesitation, we are going to use Radok’s services in the future."}
      {text: "I have engaged with Radok Force after a few failed attempts to work with cheap freelancers on oDesk. I was disappointed no one could test my app on all the devices I needed, both desktop and mobile, so didn’t even expect they could do this in such a short period. Not only my app was tested on all the platforms and devices I asked, but also I got a profound report with the recommendations for bug fixing to make my app truly responsive. I’m planning to use Radok Force in all further iterations and product pivots as it is worry-free for me. "}
    ]



]