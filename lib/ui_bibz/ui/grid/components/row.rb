module UiBibz::Ui

  # Create a row
  #
  # This element is an extend of UiBibz::Ui::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Row.new(content, options = {}, html_options = {})
  #
  #   UiBibz::Ui::Row.new(options = {}, html_options = {}) do
  #     #content
  #   end
  #
  class Row < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options('row')
    end

  end
end
