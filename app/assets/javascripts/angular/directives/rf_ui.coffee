inputTypeTemplate = (type, label)->
  html_type = type
  #nodeValidator = angular.element(document.body).injector().get('nodeValidator');
  if type == 'text'
    input_tag = 'textarea'
  else
    input_tag = 'input'
  if type == 'string'
    html_type = 'text'
  if input_tag == 'textarea'
    type_str = ""
  else if input_tag == 'input'
    type_str = "type='#{html_type}'"


  if label && label.length
    label_str = "<label>#{label}</label>"
  else
    label_str = ''
  border_wrap_str = "<div class='input-border-wrap'></div>"
  input = "<#{input_tag} #{type_str} ng-model='value' ng-change='onChange()'>"

  content = "#{label_str}#{border_wrap_str}#{input}"
  baseInputWrap(content, "string")


baseInputWrap = (content, html_class)->
  messages_wrap = "<div class='error-messages' ng-show='hasErrors()'><div class='error-message' ng-repeat='(error_key, error_value) in error()'>{{error_key}}</div></div>"
  "<div class='rf-input #{html_class}'>#{content}#{messages_wrap}</div>"

watchFocus = (element, ngModelCtrl)->
  element.on "focusin", ()->
    element.removeClass("focus-out")
    element.addClass("focus-in")
    if ngModelCtrl && ngModelCtrl.$untouched
      ngModelCtrl.$setTouched(true)

  element.on "focusout", ()->
    element.addClass("focus-out")
    element.removeClass("focus-in")


watchEmpty = (scope, element, ngModelCtrl)->
  scope.$watch (
    ()->
      ngModelCtrl.$viewValue
    (newValue, oldValue)->
#console.log "newValue: ", newValue
      newVal = ngModelCtrl.$viewValue
      empty = !newVal || !newVal.length

      ngModelCtrl.$empty = empty

      if empty
        element.addClass "is-empty"
        element.removeClass "not-empty"
      else
        element.addClass "not-empty"
        element.removeClass "is-empty"
      #console.log "ngEmpty: value: ", newValue
      #console.log "ngEmpty: empty: ", empty
      #console.log "ngEmpty: modelValue: ", ngModelCtrl.$modelValue
  )

$app.directive "ngEmpty", ()->
  restrict: "A"
  controllerAs: "ngEmpty"
  require: ["ngModel", "ngEmpty"]
  controller: ()->
  link: (scope, element, attrs, ctrls)->
    ngModelCtrl = ctrls[0]
    ###
    ngModelCtrl.$render =  ()->
      newValue = ngModelCtrl.$viewValue;
      console.log(newValue)
      if !newValue || !newValue.length
        console.log "empty"
      else
        console.log "not empty"
    ###
    watchEmpty(scope, element, ngModelCtrl)




$app.directive "rfInput", ()->
  restrict: "E"
  controllerAs: "rfInput"
  require: ["ngModel", "^form", "rfInput"]
  scope: true
  controller: ()->
  template: (element, attrs)->
    type = attrs.type || 'string'
    label = attrs.label
    if !label
      ng_model_string = attrs.ngModel
      arr = ng_model_string.split('.')
      model_name = arr[arr.length - 1]
      humanized_model_name = model_name.humanize()
      label = humanized_model_name

    return inputTypeTemplate(type, label)
  link: (scope, element, attrs, ctrls)->
    ngModelCtrl = ctrls[0]
    formCtrl = ctrls[1]
    scope.hasErrors = ()->
      keys_count(ngModelCtrl.$error) > 0
    scope.error = ()->
      ngModelCtrl.$error
    scope.onChange = ()->
      ngModelCtrl.$setViewValue(scope.value);
#      for ngModel
#      ngModelCtrl.$setValidity(validationErrorKey, isValid);

    ngModelCtrl.$render = ()->
      scope.value = ngModelCtrl.$modelValue;
    watchEmpty(scope, element, ngModelCtrl)
    watchFocus(element, ngModelCtrl)




rfMinlengthDirective = ()->
  restrict: 'A'
  require: '?ngModel'
  link: (scope, elm, attr, ctrl)->
    if (!ctrl)
      return;

    minlength = attr.rfMinLength || 0;
    attr.$observe('minlength', (value)->
      minlength = toInt(value) || 0;
      ctrl.$validate();
    );
    ctrl.$validators.minlength = (modelValue, viewValue)->
      return ctrl.$isEmpty(viewValue) || viewValue.length >= minlength;

$app.directive "rfMinLength", rfMinlengthDirective



mismatch = ($parse)->
  require: '?ngModel'
  restrict: 'A'
  link: (scope, elem, attrs, ctrl) ->
    getMatchValue = ->
      match = matchGetter(scope)
      if angular.isObject(match) and match.hasOwnProperty('$viewValue')
        match = match.$viewValue
      match

    if !ctrl
      if console and console.warn
        console.warn 'Match validation requires ngModel to be on the element'
      return
    matchGetter = $parse(attrs.mismatch)
    caselessGetter = $parse(attrs.mismatchCaseless)
    scope.$watch getMatchValue, ->
      ctrl.$$parseAndValidate()
      return

    ctrl.$validators.mismatch = ->
      match = getMatchValue()
      if caselessGetter(scope) && angular.isString(match) && angular.isString(ctrl.$viewValue)
        return ctrl.$viewValue.toLowerCase() != match.toLowerCase()
      ctrl.$viewValue != match

$app.directive "mismatch", mismatch