module UiBibz::Ui::Core::Lists::Components

  # Create a listBody
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  class ListBody < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      output = [content_tag(:p, content, html_options)]
      output << content_tag(:small, options[:extra])
      output.join.html_safe
    end

  private

    def component_html_classes
      'mb-1'
    end

  end
end
