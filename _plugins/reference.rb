module Reference
  class ReferenceTag < Liquid::Tag
    include Jekyll::Filters::URLFilters

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      @context = context
      url = relative_url("#{Jekyll::Utils.slugify(@text)}.html")
      "<a href=\"#{url}\">#{@text}</a>"
    end
  end
end

Liquid::Template.register_tag("ref", Reference::ReferenceTag)