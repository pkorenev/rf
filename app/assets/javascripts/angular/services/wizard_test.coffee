$app.config [
  "valdrProvider"
  (valdrProvider)->
    valdrProvider.addConstraints(
      WizardTest:
        project_name:
          required: {}
        version_number:
          required: {}
    )
]