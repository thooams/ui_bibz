require 'haml'
module UiBibz::Ui::Core

  # Creates a component of the given +name+ using options created by the set of +options+.
  #
  # ==== Attributes
  #
  # * +content+ -   Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Component.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Component.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Component.new(content, { type: :success, glyph: 'eye' },{ class: 'test' })
  #   # or
  #   UiBibz::Ui::Core::Component.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end
  #
  class Component < UiBibz::Ui::Base

    attr_accessor :content, :html_options, :options

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

    def html_options
      @html_options
    end

    def content
      @content
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
      options[:status] unless options[:status].nil?
    end

    def states
      if @states.nil?
        states = {}
        %w(default success primary info warning danger).each do |s|
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
