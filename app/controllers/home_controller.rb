class HomeController < ApplicationController
  def index
  end

  def svg_images
    file_paths = Dir[Rails.root.join("app/assets/images/*.svg")]
    file_data = file_paths.map do |file_path|
      comp = File.basename(file_path)
      extn = File.extname(file_path)
      name = File.basename(file_path, extn)

      file_content = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse file_content
      res = res = doc.to_html

      compressor = HtmlCompressor::Compressor.new
      compressed = compressor.compress(res)
      compressed_without_xml_dtd = compressed.sub(/<\?xml.*\?>/, '')



      {content: compressed_without_xml_dtd, file_path: name}
    end

    render inline: file_data.to_json

  end
end
