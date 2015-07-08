module UiBibz::Ui::Core

  # Create a col
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
  # * +num+ - Integer | 0..12
  # * +offset+ - Integer
  # * +size+ - Integer
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Col.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Col.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Col.new({num: 2, offset: 1, size: 3}, class: 'test') do
  #     #content
  #   end
  #
  #   UiBibz::Ui::Core::Col.new([{num: 2, offset: 1, size: 3}, { num: 3}], class: 'test') do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   col(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class Col < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @cols = []
    end

    def render
      content_tag :div, @content, class_and_html_options(col_classes)
    end

  private

    def col_classes
      classes = []
      [@options].flatten.each do |col|
        classes << add_classes("col-#{ size(col) }-#{ num(col) }", offset(col))
      end
      @options = {}
      classes.join(' ')
    end

    def size col
      col[:size] || :md
    end

    def num col
      col[:num] || 1
    end

    def offset col
      "col-offset-#{ col[:offset] }" if col[:offset]
    end

  end
end
