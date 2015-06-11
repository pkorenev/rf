window.keys_count = (obj)->
  if typeof obj != 'object'
    return null
  keys = []
  for k,v of this
    keys.push k
  return keys.length

String.prototype.toDash = ()->
  return this.replace /([A-Z])/g, ($1)->
    return "-"+$1.toLowerCase()


wrapElement = (element, attrs)->




$app.directive "rfSelect", [ ()->
  template: (element, attrs)->
    collection = attrs.collection
  scope: false

]




$app.directive "myInput", ()->
  template: (element, attrs)->
    #console.log "attrs", attrs
    input_str = "<input "
    excluded_attrs = ["label"]
    for k, v of attrs
      if k[0] != '$' && excluded_attrs.indexOf(k) == -1
#        if k == 'ngModel'
#          k = 'ng-model'
        k = k.toDash()
        input_str += "#{k}='#{v}'"
    input_str += "/>"
    label_str = "<label>#{attrs.label}</label>"
    border_wrap_str = "<div class='input-border-wrap'></div>"

    error_messages_str = "<div class='error-messages' ng-show='form_field.$touched && keys_count(form_field.$error)'><div ng-repeat='(error_key, error_value) in form_field.$error' class='field-error-message {{error_key}}'>{{getErrorMessage(error_key)}}</div></div>"


    input_wrap = "<div ng-class='wrap_class()' class='rf-input-wrap'>#{border_wrap_str}#{label_str}#{input_str}#{error_messages_str}</div>"
    #return str
    str = input_wrap
    return str
  replace: true
  scope: true
  link: (scope, element, attrs, ctrl, transcludeFn)->
    element.on "focusin", ()->
      element.removeClass("focus-out")
      element.addClass("focus-in")
    element.on "focusout", ()->
      element.addClass("focus-out")
      element.removeClass("focus-in")
      #console.log "focusout"
    scope.form = scope.$parent.login
    scope.form_field = scope.form[attrs.name]

    scope.wrap_class = ()->
      touched = if scope.form_field.$touched then 'ng-touched' else 'ng-untouched'
      is_empty = if !scope.form_field.$modelValue || !scope.form_field.$modelValue.length then 'is-empty' else 'not-empty'
      c = "#{touched} #{is_empty}"

      return c

    scope.getErrorMessage = (error_key)->
      if !error_key || !error_key.length
        return ''
      error_key[0] = error_key[0].toUpperCase()
      msg = attrs["errorMessage" + error_key]
      if !msg
        msg = error_key
      return msg
#scope.

$app.directive "equalTo", ()->
  restrict: "A"
  require: "ngModel"
  link: (scope, element, attrs, model, transcludeFn)->
    scope.$watch attrs.equalTo, (value)->
      # Only compare values if the second ctrl has a value.
      if typeof model.$viewValue != 'undefined' && model.$viewValue != ''
        valid = value == model.$viewValue
        model.$setValidity('equalTo', valid)
        console.log("model.setValidity", valid)



    model.$parsers.push (value)->
      # Mute the nxEqual error if the second ctrl is empty.
      if typeof value == 'undefined' || value == ''
        model.$setValidity('equalTo', true);
        return value;

      isValid = value == scope.$eval(attrs.equalTo)
      model.$setValidity('equalTo', isValid);
      value_to_return = if isValid then value else undefined

      return value_to_return
