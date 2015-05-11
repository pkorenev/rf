module ApplicationHelper
  def self.self_embedded_svg_from_absolute_path(filename, options = {}, html_safe = true)
    file = File.read(filename.to_s)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    res = doc.to_html
    res = res.html_safe if html_safe

    res
  end
end
