module UiBibz::Ui::Core::Layouts

  # Create a row
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
  # * +type+ - Symbol | :form
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Layouts::Row.new(content, options = {}, html_options = {})
  #
  #   UiBibz::Ui::Core::Layouts::Row.new(options = {}, html_options = {}) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #  row(content, options = {}, html_options = {})
  #
  #  row(options = {}, html_options = {}) do
  #    content
  #  end
  #
  class Row < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, content, html_options
    end

  private

    def component_html_classes
      options[:type] == :form ? 'form-row' : 'row'
    end

  end
end
