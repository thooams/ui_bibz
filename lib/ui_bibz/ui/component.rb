require 'haml'
module UiBibz::Ui
  class Component < Ui

    attr_accessor :content, :html_options, :options

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

    def glyph
      glyph_info = options.delete(:glyph)      if options.kind_of?(Hash)
      glyph_info = html_options.delete(:glyph) if glyph_info.nil?
      [Glyph.new(glyph_info).render, ' '].join unless glyph_info.nil?
    end

    def options
      @options || {}
    end

    def cls klass
      [html_options.delete(:class), options.delete(:class), klass].compact.join(' ')
    end

    def class_and_html_options classes
      options_class = options[:class] if options.kind_of?(Hash)
      html_options[:class] = [
        html_options[:class],
        options_class,
        [*classes]
      ].flatten.compact.join(' ') unless classes.nil?
      html_options
    end

    def options_in_html_options opts
      html_options.merge!(opts) unless opts.nil?
      html_options
    end

  end
end
