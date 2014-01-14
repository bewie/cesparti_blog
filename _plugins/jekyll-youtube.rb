module Jekyll
  class Youtube < Liquid::Tag
 
    def initialize(name, id, tokens)
      super
      @id = id
    end
 
    def render(context)
      %(<div class="video-container"><iframe class="vimeo-iframe" src="http://www.youtube.com/embed/#{@id}" frameborder="0" allowfullscreen>   </iframe></div>)
    end
  end
end
 
Liquid::Template.register_tag('youtube', Jekyll::Youtube)
