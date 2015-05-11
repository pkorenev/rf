svg_images = null
var _svg_images_loaded = false
$.getJSON("/svg_images", function(data){
    svg_images = data
    _svg_images_loaded = true
    $(document).trigger("svg_images_loaded")

})

svg_image_source = function(name){
    if(!svg_images || svg_images.length == 0){
        return null
    }
    svg_image = null
    for(var i = 0; i < svg_images.length; i++){
      svg = svg_images[i]
      if(name == svg['file_path']){
          svg_image = svg['content']
          break
      }
    }
    return svg_image
    //svg_images.filter(function(svg){
    //
    //    return svg['file_path'] == name
    //})
}

$(document).on('page:load ready svg_images_loaded', function(){
    if(_svg_images_loaded) {
        $("span.svg-placeholder[path]").each(function () {
            var $placeholder = $(this)
            var path = $placeholder.attr("path")
            var file_content = svg_image_source(path)
            $placeholder.replaceWith(file_content)
        })
    }
})