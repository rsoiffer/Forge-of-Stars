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
      "<a href=\"#{url}\"><span class=\"trait\">#{@my_text}</span></a>"
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

      input = input.gsub(/{[^{}]*}/) { |s|
        text = s[1..-2].strip
        slug_text = Jekyll::Utils.slugify(text)

        search = ->(map_name) {
          @context.registers[:site].data[map_name].find {
            |k, v| Jekyll::Utils.slugify(k) == slug_text
          }
        }

        if search["skills"]
          "[#{text}](skills.html)"
        elsif search["conditions"]
          "[#{text}](conditions.html##{slug_text})"
        elsif search["basic-powers"]
          "[#{text}](basic-powers.html##{slug_text})"
        else
          print("Warning: could not resolve link to text \"#{text}\"\n")
          "***#{text}***"
        end
      }

      converter = @context.registers[:site].find_converter_instance(::Jekyll::Converters::Markdown)
      input = converter.convert(input)

      input
    end

    def process_inline(input)
      input = process(input)

      input[3...-5]
    end
  end

end

Liquid::Template.register_filter(CustomFilters::ProcessFilter)
