module PageRenderer
  class RenderTag < Liquid::Block
    def render(context)
      content = super
      Liquid::Template.parse(content).render(context)
    end
  end
end

Liquid::Template.register_tag("render", PageRenderer::RenderTag)