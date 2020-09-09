# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes
  # Create a jumbotron
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
  # * +full_with+ - Boolean to render jumbotron in fullscreen
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Boxes::Jumbotron.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::Jumbotron.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::Jumbotron.new(content, full_width: true).render
  #
  #   UiBibz::Ui::Core::Boxes::Jumbotron.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   jumbotron(content, options = {} , html_options = {})
  #
  #   jumbotron(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Jumbotron < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Boxes::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        if fluid
          UiBibz::Ui::Core::Layouts::Container.new(content).render
        else
          content
        end
      end
    end

    private

    def component_html_classes
      ['jumbotron', fluid]
    end

    def fluid
      'jumbotron-fluid' unless options[:fluid].nil?
    end
  end
end
