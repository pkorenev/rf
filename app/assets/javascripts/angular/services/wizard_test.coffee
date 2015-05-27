#window.Wizard ?= {}
#Wizard.Steps ?= {}
#Wizard.Test = class Test
#  constructor: ()->
#  @new: ()->
#    steps = jQuery.getJSON("/wizard/new_test_available_steps")
#    return steps
#
#Wizard.Step = class Step
#  constructor: ()->
#
#Wizard.Steps.Intro = class Intro extends Wizard.Step


#$app.config [
#  "valdrProvider"
#  (valdrProvider)->
#    valdrProvider.addConstraints(
#      WizardTest:
#        project_name:
#          required: {}
#        version_number:
#          required: {}
#    )
#]

$app.factory "WizardTest", ($http)->
  obj =
    name: null
    data: null
    platforms: null
    load: ()->
      if obj.data == null
        $http.get("/wizard/new_test_available_steps").success (response)->
          obj.data = response
      return obj
    load_platforms: (type_of_product)->
      $http.get("/wizard/available_platforms_by_product_type/#{type_of_product}").success (response)->
        obj.platforms = response


      return obj
  return obj

#o.getAll = function() {
#return $http.get('/posts.json').success(function(data){
#angular.copy(data, o.posts);
#});
#};