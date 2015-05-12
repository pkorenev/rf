class WizardController < ApplicationController
  def index

  end

  def ng_wizard
    @platforms =  [
        {
            name: 'Browsers', image_path: "ie.svg", sub_items: [
            {name: 'Internet Explorer 9', count: 0},
            {name: 'Internet Explorer 10', count: 0},
            {name: 'Internet Explorer 11', count: 0},
            {name: 'Latest version of Firefox', count: 0},
            {name: 'Latest version of Chrome', count: 0},
            {name: 'Latest version of Safari', count: 0}
        ]
        },
        {
            name: "IOS", image_path: "apple.svg", sub_items: [
              { name: "iPhone 4", count: 0 },
              { name: "iPhone 5s", count: 0 },
              { name: "iPad 2", count: 0 },
              { name: "iPad Air", count: 0 },
              { name: "iPad mini", count: 0 },
              { name: "iPhone 6 Plus", count: 0 }
            ]
        },
        {
            name: "Android", image_path: "android.svg"
        }
    ]
  end
end
