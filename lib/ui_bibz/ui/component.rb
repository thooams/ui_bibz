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
      @html_options ||= {}
    end

    def render
      [glyph, @content].compact.join.html_safe
    end

    def html_options
      @html_options
    end

    def glyph
      glyph_info = options.delete(:glyph)      if options.kind_of?(Hash)
      glyph_info = html_options.delete(:glyph) if glyph_info.nil?
      [Glyph.new(glyph_info).render, ' '].join unless glyph_info.nil?
    end

    def options
      @options || {}
    end

    def cls klass
      [html_options.delete(:class), klass].compact.join(' ')
    end

    def class_and_html_options classes
      html_options[:class] = [html_options[:class], [*classes]].flatten.compact.join(' ')
      html_options
    end

  end
end
