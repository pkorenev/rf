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
  self =
    name: null
    data: null
    platforms: null
    initialize: ()->
      self.tester_hour_price = 20
      self.hours = [1, 2, 3, 4, 5]
      self.selected_hour = 1
      self.show_help = true
      self.type_of_product = false
      self.type_of_test = false
      self.total_testers_count = 0
      self.ready_to_checkout = false
      self.item_price = 30
      self.total_price = 0
      self.active_step_order_number = 1
      self.active_step_valid = true
      self.configuration_steps = null

      self.intro_step = {
        number: 0
        type_of_test: false
        type_of_product: false
        valid: false
      }

      self.available_steps = {
        platforms: {
          number: 1
          testers_by_platforms: {}
          hours_per_tester: 1
          valid: false
        }
        project_information: {
          number: 2
          project_name: null
          project_version: null
          project_languages: []
          report_languages: []
          valid: false
        }
        test_plan: {
          number: 3
          type_of_test: {}
          valid: false
        }
        project_access: {
          number: 4
          project_auth: false
          comment: ""
          valid: false
        }
      }



    load: ()->
      if self.data == null
        $http.get("/wizard/new_test_available_steps").success (response)->
          self.data = response
      return self


    load_steps: ()->

    load_platforms: ()->
      type_of_product = self.intro_step.type_of_product
      deferred = $http.get("/wizard/available_platforms_by_product_type/#{type_of_product}")
      console.log("deferred")
      deferred.success (response)->
        console.log("deferred->success")
        self.platforms = response
        for p in self.platforms
          for item in p.subitems
            if !item.count
              item.count = 0
      return deferred

    ###
    load_platforms: (type_of_product)->
      deferred = $q.defer()
      $http.get("/wizard/available_platforms_by_product_type/#{type_of_product}").success((result) ->
        deferred.resolve result
        return
      ).error (result) ->
        deferred.reject result
        return
      deferred
    ###

      #return self
  return self

#o.getAll = function() {
#return $http.get('/posts.json').success(function(data){
#angular.copy(data, o.posts);
#});
#};