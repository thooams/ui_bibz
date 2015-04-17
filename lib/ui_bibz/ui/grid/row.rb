module UiBibz::Ui
  class Row < Component

    # Create an alert
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Row.new(content)
    #
    #   UiBibz::Ui::Row.new() do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options('row')
    end

  end
end
