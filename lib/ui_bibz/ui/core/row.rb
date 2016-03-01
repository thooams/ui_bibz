module UiBibz::Ui::Core

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
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Row.new(content, options = {}, html_options = {})
  #
  #   UiBibz::Ui::Core::Row.new(options = {}, html_options = {}) do
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
  class Row < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, @content, class_and_html_options('row')
    end

  end
end