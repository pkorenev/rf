module WizardHelper
  def next_step_button(step_number, step_name)
    render "helpers/wizard/next_step_button", { step_number: step_number, step_name: step_name }
  end

  def summary_button
    render "helpers/wizard/summary_button", {  }
  end

  def prev_step_button(prev_step_number)
    render "helpers/wizard/prev_step_button", { prev_step_number: prev_step_number }
  end

  def wizard_step(step_number, step_title = nil, &block)
    render "helpers/wizard/wizard_step", { step_number: step_number, step_title: step_title, block: block }, &block
  end

  def option_image(image_path, name, label, value, columns_count = 4, description = nil)
    render "helpers/wizard/option_image", { image_path: image_path, name: name, label: label, value: value, description: description, columns_count: columns_count }
  end

  def blue_header(text, columns = false)
    render "helpers/wizard/blue_header", { text: text, columns: columns }
  end

  def platform(name, image_path = nil, commentable = true, &block)
    render "helpers/wizard/platform", { name: name, image_path: image_path, commentable: commentable, block: block }, &block
  end

  def option_count(name, count = 0)
    render "helpers/wizard/option_count", { name: name, count: count }
  end

  def radio_input(name, label, value, checked = false, description = nil, &block)
    render "helpers/wizard/radio_input", { name: name, label: label, value: value, description: description, checked: checked, block: block }, &block
  end

  def checkbox_input(name, label, value, checked = false)
    render "helpers/wizard/checkbox_input", { name: name, label: label, value: value, checked: checked }
  end

  def question(text, &block)
    render "helpers/wizard/question", { text: text, block: block }, &block
  end
end
