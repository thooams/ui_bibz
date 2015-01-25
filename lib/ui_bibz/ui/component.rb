require 'haml'
module UiBibz::Ui
  class Component < Ui

    # Creates a component of the given +name+ using options created by the set of +options+.
    #
    # ==== Signatures
    #
    #   Component.new(content, options = {}, html_options = {})
    #
    #   Component.new(options = {}, html_options = {}) do
    #     # content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      if !block.nil?
        @html_options, @options = options, content
        context  = eval("self", block.binding)
        @content = context.capture(&block)
      else
        @html_options, @options, @content = html_options, options, content
      end
    end

    def render
      @content
    end

    def html_options
      @html_options || {}
    end

    def options
      @options || {}
    end

    def cls klass
      [html_options.delete(:class), klass].compact.join(' ')
    end

    def class_and_html_options classes
      @html_options[:class] = [@html_options[:class], [*classes]].flatten.compact.join(' ')
      @html_options
    end

  end
end
