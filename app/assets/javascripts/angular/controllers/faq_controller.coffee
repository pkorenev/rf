window.$app.controller "FaqController", [
  "$scope", "$sce", "$http", "FaqArticle", ($scope, $sce, $http, FaqArticle)->
    $scope.faq_articles = FaqArticle
    $scope.faq_articles.load_articles().then ()->
      $scope.active_article_index = 0
      $scope.active_article = $scope.faq_articles.articles[0]
      $scope.title = "About us"
      $scope.$watch("active_article_index", (newValue)->
        newValue = parseInt(newValue) || 0
        if newValue
          $scope.active_article = $scope.faq_articles.articles[newValue]
      )


    $scope.item = 'What&nbsp;Is&nbsp;Your&nbsp;Name?'

    $scope.question_request = {
      name: ""
      email: ""
      question_title: ""
      question_description: ""
    }

    $scope.submitQuestion = ()->
      deffered = $http.post("/faq_request", $scope.question_request)
      deffered.success (data)->
        if data.code == 200
          alert("success")
        else
          alert("error")
      deffered.error ()->
        alert("deffered error")


    $scope.faqMenuClass = (index)->
      if index == $scope.active_article_index
        return "active"
      else
        return ""

    $scope.openArticle = (index)->
      $scope.active_article_index = index
]