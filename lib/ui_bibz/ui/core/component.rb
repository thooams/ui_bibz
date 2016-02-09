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
  #   UiBibz::Ui::Core::Component.new(content, { type: :success, glyph: 'eye' }, { class: 'test' })
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
      init_component_html_options
    end

    # Render html tag
    def render
      glyph_and_content_html
    end

    # Render glyph and content html
    def glyph_and_content_html
      [glyph_with_space, content].compact.join.html_safe
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
      UiBibz::Ui::Core::Label.new(options[:label], class: 'pull-right', type: :pill, state: (options[:label_state] || :default)).render
    end

    # TO REMOVE
    # Set :default state symbol
    def state
      sym = options.delete(:state) if options[:state]
      sym = sym || :primary
      states[:sym]
    end

    # TO REMOVE
    # Add classes in html_options
    def class_and_html_options classes = nil
      options_class = options[:class] if options.kind_of?(Hash)
      cls = [
        html_options[:class],
        status,
        state,
        effect,
        options_class
      ]
      cls << classes unless classes.nil?
      cls = cls.flatten.compact
      html_options[:class] = cls.empty? ? nil : cls
      html_options
    end

    # Know if component is tapped or not
    def is_tap content, options
      (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    end

  protected

    # Override this method to add html classes
    # Accept Array or String
    def component_html_classes
    end

    # Override this method to add html data
    def component_html_data
    end

    # Override this method to add html Options
    # Accept Hash
    def component_html_options
      {}
    end

    # Override this method to add a state class
    def state
    end

    # Join classes
    def join_classes *classes
      klasses = [*classes].flatten.compact.uniq.reject(&:blank?)
      klasses.empty? ? nil : klasses
    end

    # Add html data arguments
    def add_html_data name, value = true
      html_options[:data] = {} if html_options[:data].nil?
      html_options[:data].update(Hash[name, value])
    end

  private

    def initialize_component_html_classes
      cls = [
        html_options[:class],
        status,
        state,
        effect,
        options_classes,
        component_html_classes
      ]
      html_options[:class] = join_classes(cls)
    end

    # Set effect class
    def effect
      options[:effect]
    end

    def options_classes
      options[:class] if options.kind_of?(Hash)
    end

    def initialize_component_html_data
      component_html_data
    end

    def initialize_component_html_options
      html_options.merge!(component_html_options)
    end

    def init_component_html_options
      initialize_component_html_data
      initialize_component_html_classes
      initialize_component_html_options
    end

    def status
      options[:status] unless options[:status].nil?
    end

    # TO REMOVE
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

  end
end
