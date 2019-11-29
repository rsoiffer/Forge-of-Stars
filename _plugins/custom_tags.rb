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
      if !@context.registers[:site].data["traits"].key?(@my_text)
        print("Warning: unknown trait \"#{@my_text}\"\n")
      end
      url = relative_url("traits.html##{Jekyll::Utils.slugify(@my_text)}")
      "<span class=\"trait\"><a href=\"#{url}\">#{@my_text}</a></span>"
    end
  end

end

Liquid::Template.register_tag("icon", CustomTags::IconTag)
Liquid::Template.register_tag("ref", CustomTags::ReferenceTag)
Liquid::Template.register_tag("trait", CustomTags::TraitTag)


module CustomFilters

  module ProcessFilter
    def process(input)
      input = Liquid::Template.parse(input).render(@context)

      converter = Jekyll::Converters::Markdown::LinkerProcessor.new(@context.registers[:site].config)
      
      converter.convert(input)
    end

    def process_inline(input)
      process(input)[3...-5]
    end
  end

end

class Jekyll::Converters::Markdown::LinkerProcessor
  def initialize(config)
    @converter = Jekyll::Converters::Markdown::KramdownParser.new(config)
  end

  def convert(content)
    new_content = content.gsub(/{[^{}]*}/) { |s|
      text = s[1..-2].strip
      slug_text = Jekyll::Utils.slugify(text)

      get_map = ->(map_name) {
        map_name.split("/").reduce(Jekyll::sites[0].data) {
          |m, part| m[part]
        }
      }

      m = {}
      m["skills"] = "[#{text}](skills.html)"
      m["conditions"] = "[#{text}](conditions.html##{slug_text})"
      m["basic-powers"] = "[#{text}](basic-powers.html##{slug_text})"
      m["weapons/traits"] = "[#{text}](weapons.html##{slug_text})"
      for school in get_map["power_data"]
        m["power_data/#{school[0]}"] = "[#{text}](#{school[0]}.html##{slug_text})"
      end

      m.map { |val|
        val[1] if get_map[val[0]].find { |k, v|
          Jekyll::Utils.slugify(k) == slug_text
        }
      }.compact.first || begin
        print("Warning: could not resolve link to text \"#{text}\"\n")
        "***#{text}***"
      end
    }
    @converter.convert(new_content)
  end
end

Liquid::Template.register_filter(CustomFilters::ProcessFilter)
