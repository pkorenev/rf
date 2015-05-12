class WizardController < ApplicationController
  def index

  end

  def ng_wizard
    @platforms =  [
        {name: 'Browsers', sub_items: [
            {name: 'Internet Explorer 9', count: 0},
            {name: 'Internet Explorer 10', count: 0},
            {name: 'Latest version of Firefox', count: 0},
            {name: 'Latest version of Chrome', count: 0}
        ]
        }
    ]
  end
end
