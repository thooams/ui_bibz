# frozen_string_literal: true

module UiBibz::Builders
  # Class to build html classes
  class HtmlOptionsBuilder
    attr_accessor :html_options
    attr_reader :options

    def initialize(html_options, options)
      @html_options = html_options
      @options = options
    end

    def initialize_component_html_options(component_html_options)
      html_options.merge!(component_html_options)
    end

    def initialize_component_html_classes(component_html_classes)
      html_options[:class] = component_html_classes
    end
  end
end
