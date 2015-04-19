module UiBibz::Ui
  class Jumbotron < Component

    # Create a jumbotron
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Jumbotron.new(content, full_width: true)
    #
    #   UiBibz::Ui::Jumbotron.new() do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options('jumbotron') do
        if full_width
          content_tag :div, @content, class: 'container'
        else
          @content
        end
      end
    end

  private

    def full_width
      @options[:full_width]
    end

  end
end
