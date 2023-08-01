# frozen_string_literal: true

module UiBibz::Builders
  # Class to build html options
  class HtmlOptionsBuilder
    def initialize
      @html_options = []
    end

    # Add options
    # @param [Array|String] options
    # @return [Void]
    def add(options)
      @html_options.merge(options)
    end

    def remove(options)
      @html_options.delete(options)
    end

    def to_h
      @html_options
    end
  end
end
