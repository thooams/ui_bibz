# frozen_string_literal: true

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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:success+, +:info+, +:warning+, +:danger+,
  #   +:light+, :+dark+)
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

    # Constants
    STATUSES = %i[primary secondary success danger warning info light dark].freeze
    BREAKPOINTS = %i[xxl xl lg md sm xs].freeze
    SIZES = %i[lg md sm].freeze

    attr_accessor :content, :html_options, :options

    # Use link_to system in rails
    # * Content can be send by content variable or by block
    #   if a block is sent, variable 'content' does not exit.
    # * Options of component is defined in hash options
    # * Html options is defined in hash html_options
    def initialize(content = nil, options = nil, html_options = nil, &block)
      component_initialize_factory_method = UiBibz::FactoryMethods::ComponentInitializeFactoryMethod.new(self, self.binding).make
      @content = component_initialize_factory_method.content
      @html_options = component_initialize_factory_method.html_options
      @options      = component_initialize_factory_method.options

      @data_html_options_builder = UiBibz::Builders::DataHtmlOptionsBuilder.new(@content, @options, @html_options)

      init_options
      init_component_html_options
    end

    # Render html tag with or without cache
    def render
      render_with_or_without_cache
    end

    # Render without cache
    def pre_render
      glyph_and_content_html
    end

    # Know if component is tapped or not
    delegate :tapped?, to: :'UiBibz::Utils::Screwdriver'

    protected

    # Override this method to add html classes
    # Accept Array or String
    def component_html_classes
      []
    end

    # Override this method to add html data
    def component_html_data; end

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

    def disabled?
      options[:state] == :disabled || html_options[:disabled]
    end

    def sanitize_text(text)
      sanitize(text, tags: [], attributes: [])
    end

    private

    def render_with_or_without_cache
      if options[:cache]
        cache      = Rails.cache
        read_cache = cache.read(options[:cache])
        if read_cache
          read_cache
        else
          cache.write(options[:cache], pre_render)
          pre_render
        end
      else
        pre_render
      end
    end

    def init_options
      @options = component_options.merge(@options).with_indifferent_access
    end

    def init_component_html_options
      component_html_data
      html_options_builder = UiBibz::Builders::HtmlOptionsBuilder.new(@data_html_options_builder.output, options)
      html_options_builder.initialize_component_html_classes initialize_component_html_classes
      html_options_builder.initialize_component_html_options component_html_options
      @html_options = html_options_builder.html_options
    end
  end
end
