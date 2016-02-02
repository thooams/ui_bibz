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

    # Use link_to system in rails
    # * Content can be send by content variable or by block
    #   if a block is sent, variable 'content' does not exit.
    # * Options of component is defined in hash options
    # * Html options is defined in hash html_options
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
      add_data_html_options
    end

    # Render html tag
    def render
      glyph_and_content_html
    end

    # Render glyph and content html
    def glyph_and_content_html
      [glyph_with_space, @content].compact.join.html_safe
    end

    # Render glyph with space html
    def glyph_with_space
      "#{ glyph } " unless glyph.nil?
    end

    # Render glyph html
    def glyph
      glyph_info = options[:glyph] if options.kind_of?(Hash)
      Glyph.new(glyph_info).render unless glyph_info.nil?
    end

    def label_html
      UiBibz::Ui::Core::Label.new(@options[:label], class: 'pull-right', type: :pill, state: (@options[:label_state] || :default)).render
    end

    # Set :default state symbol
    def state
      sym = options.delete(:state) if options[:state]
      sym = sym || :primary
      states[:sym]
    end

    def effect
      @options[:effect]
    end

    # Add classes in html_options
    def class_and_html_options classes = nil
      options_class = options[:class] if options.kind_of?(Hash)
      cls = [
        html_options[:class],
        status,
        other_classes,
        state,
        effect,
        options_class
      ]
      cls << classes unless classes.nil?
      cls = cls.flatten.compact
      html_options[:class] = cls.join(' ') unless cls.empty?
      html_options
    end

    # Add classes in html_options
    def add_classes *classes
      classes.compact.join(' ')
    end

    def is_tap content, options
      (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    end

    def add_html_data name, value = true
      @html_options = @html_options.merge(Hash["data-#{ name.dasherize }", value])
    end

  protected

    # Add your data html options
    def add_data_html_options
    end

    def status
      options[:status] unless options[:status].nil?
    end

    def states
      if @states.nil?
        states = {}
        %w(success primary secondary info warning danger).each do |s|
          states = states.merge(Hash[s.to_sym, s])
        end
        @states = states
      end
      @states
    end

    def other_classes
    end

  end
end
