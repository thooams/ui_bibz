require 'haml'
require 'ui_bibz/ui/extensions/core/component/klass_extension'
require 'ui_bibz/ui/extensions/core/component/glyph_extension'
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
  # * +status+ - status of élement with symbol value:
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
    include KlassExtension
    include GlyphExtension

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
      init_options
      init_component_html_options
    end

    # Render html tag
    def render
      glyph_and_content_html
    end

    # Know if component is tapped or not
    def is_tap content, options
      (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    end

  protected

    # Override this method to add html classes
    # Accept Array or String
    def component_html_classes
      []
    end

    # Override this method to add html data
    def component_html_data
    end

    # Override this method to add html Options
    # Accept Hash
    def component_html_options
      {}
    end

    # Override this method to add Options to the component
    # Accept Hash
    def component_options
      {}
    end

    # Override this method to add html classes to wrapper
    def component_wrapper_html_classes
      []
    end

    # Add html data arguments
    def add_html_data name, value = true
      html_options[:data] = {} if html_options[:data].nil?
      value = value.kind_of?(String) ? value.strip : value
      html_options[:data].update(Hash[name, value])
    end

  private

    def init_options
      @options = component_options.merge(@options)
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

  end
end
