helper_path = "/assets/helpers/wizard/"
#$app



helper "optionImage",
  template_name: "option_image"
  require: "ngModel"
  scope:
    ng_model: "=ngModel"
  args:
    name: "@"
    label: "@"
    value: "@"
    description: "@"
    #ng_model: "=model"
    image_name: "@imagePath"
    columns_count: "@columnsCount"
  optional: ["ng_model"]
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.columns_count = "4" if !parseInt(scope.columns_count)
    scope.id = "#{scope.name}__#{attrs.id}"
    scope.image_path = "/assets/#{scope.image_name}.svg"
    #scope.ng_model = scope[attrs.ngModel]
    #element.on "click", ()->
    #  ctrl.$setViewValue(element.find("input").val())
#    scope.$watch 'ng_model', (newValue, oldValue)->
#      scope[attrs.ngModel] = newValue


###
helper "nextStepButton",
  template_name: "next_step_button"
  args:
    step_number: "@stepNumber"
    step_name: "@stepName"

###

$app.directive "nextStepButton", ()->
  templateUrl: "/assets/helpers/wizard/_next_step_button.html"
  #require: "disabled"
  scope:
    model_active_step: "=modelActiveStep"
    model_next_step: "=modelNextStep"
  link: (scope, element, attrs, ctrl, transcludeFn)->
#    scope.disabledClass = ()->
#      if scope.disabled
#        return "disabled"
#      else
#        return "enabled"
    scope.step_number = scope.model_next_step.number
    scope.step_name = scope.model_next_step.name


    scope.$watch("model_active_step", (newValue)->

      scope.disabled_class = if newValue && newValue.valid then "enabled" else "disabled"
    )

    scope.$watch("model_active_step.valid", (newValue)->
      scope.disabled_class = if newValue then "enabled" else "disabled"
    )

helper "goButton",
  template_name: "go_button"
  args:
    text: "@"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.text ?= "Next"
    scope.image = '/assets/rf-icon-rocket.svg'
    scope.button_class = "go-button"

helper "configureButton",
  template_name: "go_button"
  args:
    text: "@"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.text ?= "Configure"
    scope.image = '/assets/rf-icon-rocket.svg'
    scope.button_class = "configure-button"


helper "nextQuestionButton",
  template_name: "next_question_button"

helper "summaryButton",
  template_name: "summary_button"

#helper "configureButton",
#  template_name: "configure_button"

helper "prevStepButton",
  template_name: "prev_step_button"
  args:
    prev_step_number: "@prevStepNumber"

###
helper "wizardStep",
  template_name: "wizard_step",
  args:
    step_number: "@stepNumber"
    step_title: "@stepTitle"
    html_class: "@htmlClass"
    id: "@stepId"
    model: "=ngModel"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.html_class ?= false
    scope.active = parseInt(scope.id) == parseInt(scope.model)
###

###
helper "introStep",
  template_name: "wizard_step"
#scope:
#  model: "=ngModel"
  args:
    step_title: "@stepTitle"
    html_class: "@htmlClass"
    id: "@stepId"

  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.html_class ?= false
    scope.active = parseInt(scope.id) == parseInt(scope.model)
#scope.active = parseInt(scope.)
#alert("id: #{scope.id}\nmodel: #{scope.model}\nactive: #{scope.active}")
###

$app.directive "introStep", ()->
  transclude: true
  templateUrl: "/assets/helpers/wizard/_wizard_step.html"
  scope:
    step_number: "@stepNumber"
    step_title: "@stepTitle"
    html_class: "@htmlClass"
    step_id: "@stepId"
    model: "=activeStepId"
    wizard: "="
    child_scope_source: "@childScopeSource"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.html_class ?= false
    scope.active = parseInt(scope.id) == parseInt(scope.model)



    if scope.child_scope_source == "controller"
      scope.child_scope = angular.element("[ng-controller]").scope()
    else if scope.child_scope_source == null
      scope.child_scope = scope

    scope.$watch('model', (newValue, oldValue)->
      #alert("activeStepId changed:\noldValue: #{oldValue}\nnewValue: #{newValue}\nstep_id: #{scope.step_id}")
      scope.active = parseInt(scope.step_id) == parseInt(newValue)
      #scope.active = true
    )

    #scope.child_scope_source ?= element
#    transcludeFn scope.child_scope, (clone, childScope)->
#      element.find('.transcluded-content, .yield').append(clone)

$app.directive "wizardStep", ()->
  transclude: true
  templateUrl: "/assets/helpers/wizard/_wizard_step.html"
  scope:
    step_number: "@stepNumber"
    step_title: "@stepTitle"
    html_class: "@htmlClass"
    step_id: "@stepId"
    model: "=activeStepId"
    wizard: "="
    child_scope_source: "@childScopeSource"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.html_class ?= false
    scope.active = parseInt(scope.step_id) == parseInt(scope.model)
    #scope.active =true
    scope.$watch('model', (newValue, oldValue)->
      #alert("activeStepId changed:\noldValue: #{oldValue}\nnewValue: #{newValue}")
      scope.active = parseInt(scope.step_id) == parseInt(newValue)
      #scope.active = true

    )

    step_index = scope.step_id - 1
    scope.proceeded = false
    scope.$watch "wizard.steps[#{step_index}].proceeded", (newValue)->
      scope.proceeded = newValue


    if scope.child_scope_source == "controller"
      scope.child_scope = angular.element("[ng-controller]").scope()
    else if scope.child_scope_source == null
      scope.child_scope = scope.$new()

    transcludeFn scope.child_scope, (clone, childScope)->
      element.find('.transcluded-content, .yield').filter(':not(.transcluded)').each ()->
        angular.element(this).append(clone)
        angular.element(this).addClass('transcluded')





helper "blueHeader",
  template_name: "blue_header"
  args:
    text: "@"
    columns: "@"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.columns ?= false


###
helper "platform",
  require: "ngModel"
  args:
    name: "@"
    image_path: "@imagePath"
    commentable: "@"
    model: "=ngModel"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.commentable ?= true
    scope.name ?= scope.model.name
    scope.image_path ?= scope.model.image_path

###


$app.directive "platform", ()->
  restrict: "E"
  require: "ngModel"
  templateUrl: "/assets/helpers/wizard/_platform.html"
  transclude: true
  scope:
    name: "@"
    image_path: "@imagePath"
    commentable: "@"
    model: "=ngModel"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.commentable ?= true
    scope.name ?= scope.model.name
    scope.image_path ?= scope.model.image_path

    child_scope_source = attrs.childScopeSource || 'this'
    child_scope = null
    if child_scope_source == 'this'
      child_scope = scope.$new()
    else if child_scope_source == 'controller'
      child_scope = $("[ng-controller]").scope().$new()

    #transcludeFn child_scope, (clone, childScope)->
    #  element.find('.yield').append(clone)


###
helper "optionCount",
  template_name: "option_count"
  require: "ngModel"
  args:
    name: "@"
    ng_model: "=ngModel"
  #optional: ["ng_model"]
###

$app.directive "optionCount", ()->
  templateUrl: "/assets/helpers/wizard/_option_count.html"
  require: "ngModel"
  transclude: true
  replace: true
  scope:
    model: "=ngModel"
    name: "@name"
    html_id: "@htmlId"

  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.name = scope.model.name
    scope.count = scope.model.count || 0
    scope.focused = false

    ###
    scope.change_value = (e)->
      alert("handler")
      $label = $(this)
      $input_wrap = $label.closest(".input-wrap")
      $input = $input_wrap.find("input")
      $input.addClass("focus")
      increment = 1
      decrement = 1
      input_value = parseInt($input.val())
      if $label.hasClass("increment")
        #$input.val(input_value + increment)
        scope.model.count = scope.model.count + increment
      else if $label.hasClass("decrement")
        #$input.val(input_value - decrement)
        scope.model.count = scope.model.count + decrement
    ###

    scope.decrement = ()->
      console.log("count", scope.model.count)
      val = (parseInt(scope.model.count) || 0) - 1
      min = 0
      if val < min
        val = min
      if val != scope.model.count
        scope.model.count = val

    scope.increment = ()->
      console.log("count", scope.model.count)
      scope.model.count = (parseInt(scope.model.count) || 0) + 1

    scope.focus = ()->
      #element.find("input").addClass("focus")
      scope.focused = true
    element.find("input").bind("keypress", (e)->
      if e.charCode < 48 || e.charCode > 57
        e.preventDefault()
    )

    #element.find("div.option-count label, div.option-count input").bind "click",  scope.change_value


$app.directive "commentWithPrice", ()->
  templateUrl: "/assets/helpers/wizard/_comment_with_price.html"
  scope:
    model_comment: "=modelComment"
    model_price: "=modelPrice"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.in_edit = false
    scope.in_new = false
    scope.empty = false
    scope.focusin = false

    scope.$watch("model_comment", (newValue)->
      scope.empty = !newValue.length
    )

    scope.$watch("focusin", (newValue)->
      if newValue
        element.find("textarea").focus()
    )

    scope.new = ()->
      scope.in_new = true
    scope.edit = ()->
      scope.in_edit = true

    scope.edit_or_create = ()->
      if scope.model_comment && scope.model_comment.length
        scope.edit()
        scope.focusin = true
      else
        scope.new()
        scope.focusin = true
        #element.find("textarea").focus()


    element.find("textarea").on "focusout", ()->
      scope.in_edit = false
      scope.in_new = false
      scope.focusin = false


$app.directive "radioInput", ()->
  templateUrl: "/assets/helpers/wizard/_radio_input.html"
  require: "ngModel"
  transclude: true
  replace: true
  scope:
    model: "=ngModel"
    name: "@name"
    label: "@"
    value: "@"
    id: "@"
    methodology: "=methodologyData"
    with_description: "@withDescription"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    transcluded = element.find('.yield').contents()
    scope.block_given = transcluded.length > 0
    #scope.name = scope.
    scope.full_id = "#{attrs.name}__#{attrs.id}"

    transcludeFn scope, (clone, childScope)->
      element.find('.transcluded-content, .yield').append(clone)
      #alert($('.selectize-tags-input input').length)
      #$('.selectize-tags-input > input:not(.tags-input-initialized)').addClass('tags-input-initialized').tagsInput()








###
helper "radioInput",
  template_name: "radio_input"
  args:
    name: "@"
    label: "@"
    value: "@"
    ng_model: "=model"
  optional: ["ng_model"]
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.id = "#{scope.name}__#{attrs.id}"
###

###
helper "checkboxInput",
  template_name: "checkbox_input"
  args:
    name: "@"
    label: "@"
    value: "@"
    ng_model: "=model"
  optional: ["ng_model"]
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.id = "#{scope.name}__#{attrs.id}"
###


$app.directive "checkboxInput", ()->
  templateUrl: "/assets/helpers/wizard/_checkbox_input.html"
  require: "ngModel"
  transclude: false
  replace: true
  scope:
    model: "=ngModel"
    name: "@name"
    label: "@"
    value: "@"
    id: "@"
    model_count: "=modelCount"
  link: (scope, element, attrs, ctrl, transcludeFn)->
#scope.name = scope.
    scope.full_id = "#{attrs.name}__#{attrs.id}"
    scope.label ?= scope.value
    element.find("input").on "change", ()->

      $input = $(this)
      checked = $input.filter(":checked").length > 0
      value = $input.val()
      #alert("checked: #{checked}\nvalue=#{value}")
      arr = scope.model
      if checked
        arr.push(value)
      else
        arr.splice(arr.indexOf(value), 1)
      arr_count = arr.length
      scope.model = arr
      scope.model_count = Math.random()
      #scope.model = scope.model + 1

      if scope.name == 'project_languages'
        cs = angular.element("[ng-controller]").scope()
        cs.project_languages_count = cs.project_languages_count + 1
        cs.$apply()
      if scope.name == 'report_languages'
        cs = angular.element("[ng-controller]").scope()
        cs.report_languages_count = cs.report_languages_count + 1
        cs.$apply()

$app.directive "checkboxInputCollection", ()->
  templateUrl: "/assets/helpers/wizard/_checkbox_input_collection.html"
  require: "ngModel"
  transclude: false
  replace: false
  scope:
    model: "=ngModel"
    name: "@name"
    #label: "@"
    #value: "@"
    #id: "@"
    model_count: "=modelCount"
    model_available: "=modelAvailable"
  link: (scope, element, attrs, ctrl, transcludeFn)->
#scope.name = scope.
    scope
    scope.full_id = "#{attrs.name}__#{attrs.id}"
    scope.label ?= scope.value
    element.find("input").on "change", ()->

      $input = $(this)
      checked = $input.filter(":checked").length > 0
      value = $input.val()
      #alert("checked: #{checked}\nvalue=#{value}")
      arr = scope.model
      if checked
        arr.push(value)
      else
        arr.splice(arr.indexOf(value), 1)
      arr_count = arr.length
      scope.model = arr
      scope.model_count = Math.random()
#scope.model = scope.model + 1


###
helper "question",
  args:
    text: "@"
    centered: "@"
    required: "@"
  linkFn: (scope, element, attrs, ctrl, transcludeFn)->
    scope.centered ?= false
    scope.required = attrs.required || false

###

$app.directive "question", ()->
  scope:
    text: "@"
    centered: "@"
    required: "@"
  templateUrl: "/assets/helpers/wizard/_question.html"
  transclude: true
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.centered ?= false
    scope.required ?= false


###
$app.directive "svgImage", ()->
  replace: false
  transclude: true
  scope:
    src: "@"
  templateUrl: "/assets/helpers/wizard/svg_image.html"
  #template: "<ng-include src='\'/assets/android.svg\''></ng-include>"
  #template: '<ng-include src="\'image_url\'"></ng-include>'
  #template: "<img src='{{image_url}}'/>"
  link: (scope, element, attrs, ctrl, transcludeFn)->
    scope.image_url = "/assets/#{attrs.src}.svg"
    #scope.image_url = "/assets/#{attrs.src}.svg"
    #scope.image_url = "/assets/android.svg"
###

###
$app.directive "svgImage", (compileFn)->
  replace: true
  scope: false
  restrict 'EA'
  link: (scope, element, attrs)->
    scope.image_url = attrs.src || null
    dom = angular.element "<div class='svg-image' ng-include='image_url'></div>"
    $e = compileFn(dom)(scope)
    element.replaceWith($e)
###


###
$app.directive "yield",
  replace: true
  scope: false
  template: "<div class='transcluded-content'></div>"
###


#$app.directive 'optionImage', ()->
#  #require: ['ngModel']
#  replace: true
#  scope:
#    ng_model: "=model"
#    image_path: "@imagePath"
#  transclude: true
#  templateUrl: "#{helper_path}_option_image.html"
#  link: (scope, element, attrs, ctrl, transclude)->
#    scope.name = attrs.name
#    scope.label = attrs.label
#    scope.value = attrs.value
#    scope.columns_count = attrs.columnsCount || 4
#    scope.description = attrs.description || null
#    scope.id = "#{scope.name}__#{attrs.id}"
#    scope.image_path = "/assets/android.svg"
#
#    transclude scope, (clone, childScope)->
      #if !scope.ng_model
        #element.find('input').removeAttr("ng-model")
###
  .directive 'introStep', ()->
    replace: true
    scope:
      step_title: "@stepTitle"
      html_class: "@htmlClass"
    transclude: true
    templateUrl: "#{helper_path}_wizard_step.html"
    link: (scope, element, attrs, ctrl, transclude)->
      scope.html_class ?= false
      transclude scope, (clone, childScope)->
        element.find('.transcluded-content').append(clone)


  .directive 'question', ()->
    replace: true
    scope:
      text: "@"
      centered: "@"
    transclude: true
    templateUrl: "#{helper_path}_question.html"
    link: (scope, element, attrs, ctrl, transclude)->
      scope.centered ?= false
      transclude scope, (clone, childScope)->
        element.find('.transcluded-content').append(clone)

  .directive 'blueHeader', ()->
    replace: true
    scope:
      text: "@"
      columns: "@"
    transclude: true
    templateUrl: "#{helper_path}_blue_header.html"
    link: (scope, element, attrs, ctrl, transclude)->
      scope.columns ?= false
      transclude scope, (clone, childScope)->
        element.find('.transcluded-content').append(clone)

  .directive 'blueHeader', ()->
    replace: true
    scope:
      text: "@"
      columns: "@"
    transclude: true
    templateUrl: "#{helper_path}_blue_header.html"
    link: (scope, element, attrs, ctrl, transclude)->
      scope.columns ?= false
      transclude scope, (clone, childScope)->
        element.find('.transcluded-content').append(clone)

.directive "container", ()->
    scope: {}
    transclude: true
    replace: true
    template: "<div class='my-container  columns-{{columns_count}}'><div class='container-header'></div><div class='container-content'><div>static label</div><div class='transcluded-content'  >{{transcluded_content}}</div></div><div class='container-footer'>name: {{name}}<br>title: {{title}}</div></div>"
    link: (scope, element, attrs, ctrl, transclude)->
      scope.name = "my name"
      scope.title = "my title"
      scope.columns_count = attrs['columnsCount'] || 4
      transclude scope, (clone, childScope)->
        element.find('.transcluded-content').append(clone)

###

