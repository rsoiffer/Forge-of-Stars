module CustomTags

  class IconTag < Liquid::Tag
    include Jekyll::Filters::URLFilters

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      @context = context
      @my_text = Liquid::Template.parse(@text).render(@context)
      "<img title=\"#{@my_text}\" class=\"inline-icon\" src=\"assets/svg/#{Jekyll::Utils.slugify(@my_text)}.svg\">"
    end
  end

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

  class TraitTag < Liquid::Tag
    include Jekyll::Filters::URLFilters

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      @context = context
      @my_text = Liquid::Template.parse(@text).render(@context)
      url = relative_url("traits.html##{Jekyll::Utils.slugify(@my_text)}")
      "<a href=\"#{url}\"><span class=\"trait\">#{@my_text}</span></a>"
    end
  end

end

Liquid::Template.register_tag("icon", CustomTags::IconTag)
Liquid::Template.register_tag("ref", CustomTags::ReferenceTag)
Liquid::Template.register_tag("trait", CustomTags::TraitTag)


module CustomFilters
  module LiquifyFilter
    def liquify(input)
      Liquid::Template.parse(input).render(@context)
    end
  end
end

Liquid::Template.register_filter(CustomFilters::LiquifyFilter)
