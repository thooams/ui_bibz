module UiBibz::Ui
  class Col < Component

    # Create a col
    #
    # ==== Signatures
    #
    #
    #   UiBibz::Ui::Row.new({num: 2, offset: 1, size: 3}, class: 'test') do
    #     #content
    #   end
    #
    #   UiBibz::Ui::Row.new([{num: 2, offset: 1, size: 3}, { num: 3}], class: 'test') do
    #     #content
    #   end
    #
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
