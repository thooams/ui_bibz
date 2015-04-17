require 'haml'
module UiBibz::Ui
  class Component < Ui

    attr_accessor :content, :html_options, :options

    # Creates a component of the given +name+ using options created by the set of +options+.
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Component.new(content, options = {}, html_options = {})
    #
    #   UiBibz::Ui::Component.new(options = {}, html_options = {}) do
    #     # content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      if !block.nil?
        @html_options, @options = options, content
        context  = eval("self", block.binding)
        @content = context.capture(&block)
      else
        if content.kind_of?(Hash)
          @html_options, @options = options, content
        else
          @html_options, @options, @content = html_options, options, content
        end
      end
      @html_options = @html_options || {}
      @options      = @options || {}
    end

    def render
      glyph_and_content_html
    end

    def glyph_and_content_html
      [glyph_with_space, @content].compact.join.html_safe
    end

    def glyph
      glyph_info = options[:glyph] if options.kind_of?(Hash)
      Glyph.new(glyph_info).render unless glyph_info.nil?
    end

    def glyph_with_space
      "#{ glyph } " unless glyph.nil?
    end

    def options
      @options
    end

    def state
      sym = options.delete(:state) if options[:state]
      sym = sym || :default
      states[:sym]
    end

    def badge_html
      content_tag :span, @options[:badge], class: 'badge'
    end

    def class_and_html_options classes = nil
      options_class = options[:class] if options.kind_of?(Hash)
      cls = [
        html_options[:class],
        status,
        state,
        options_class
      ]
      cls << classes unless classes.nil?
      cls = cls.flatten.compact
      html_options[:class] = cls.join(' ') unless cls.empty?
      html_options
    end

    def options_in_html_options opts
      html_options.merge!(opts) unless opts.nil?
      html_options
    end

    def status
      options[:status]
    end

    def states
      if @states.nil?
        states = {}
        %w(default success primary info waring danger).each do |s|
          states = states.merge(Hash[s.to_sym, s])
        end
        @states = states
      end
      @states
    end

    def add_classes *classes
      classes.compact.join(' ')
    end

  end
end
