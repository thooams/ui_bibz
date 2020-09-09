# frozen_string_literal: true

require 'haml'
require 'ui_bibz/ui/extensions/core/component/klass_extension'
require 'ui_bibz/ui/extensions/core/component/glyph_extension'
require 'ui_bibz/ui/extensions/core/component/popover_extension'
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
    include PopoverExtension

    # Constants
    STATUSES = %i[primary secondary success danger warning info light dark].freeze
    SIZES    = %i[lg md sm].freeze

    attr_accessor :content, :html_options, :options

    # Use link_to system in rails
    # * Content can be send by content variable or by block
    #   if a block is sent, variable 'content' does not exit.
    # * Options of component is defined in hash options
    # * Html options is defined in hash html_options
    def initialize(content = nil, options = nil, html_options = nil, &block)
      if !block.nil?
        @html_options = options
        @options = content
        read_cache = Rails.cache.read(@options.try(:[], :cache))
        if read_cache.nil?
          context  = eval('self', block.binding) # rubocop:disable Style/EvalWithLocation
          @content = context.capture(&block)
        else
          @content = read_cache
        end
      elsif content.is_a?(Hash)
        @html_options = options
        @options = content
      else
        @html_options = html_options
        @options = options
        @content = content
      end
      @html_options = (@html_options || {}).with_indifferent_access
      @options      = (@options || {}).with_indifferent_access
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
    def tap?(content, options)
      (content[:tap] if content.is_a?(Hash)) || (options[:tap] unless options.nil?)
    end

    protected

    # Override this method to add html classes
    # Accept Array or String
    def component_html_classes
      []
    end

    # Override this method to add html data
    def component_html_data
      # To stimulusjs
      data_target = html_options.try(:[], :data).try(:[], :target) || options.try(:delete, :target)
      add_html_data(:target, value: data_target) unless data_target.nil?

      data_controller = html_options.try(:[], :data).try(:[], :controller) || options.try(:delete, :controller)
      add_html_data(:controller, value: data_controller) unless data_controller.nil?

      data_action = html_options.try(:[], :data).try(:[], :action) || options.try(:delete, :action)
      add_html_data(:action, value: data_action) unless data_action.nil?

      # To turbolinks
      data_turbolinks = html_options.try(:[], :data).try(:[], :turbolinks) || options.try(:delete, :turbolinks)
      add_html_data(:turbolinks, value: data_turbolinks) unless data_turbolinks.nil?
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
    def add_html_data(name, value: true)
      html_options[:data] = {} if html_options[:data].nil?
      value = value.is_a?(String) ? value.strip : value
      html_options[:data].update(Hash[name, value])
    end

    def disabled?
      options[:state] == :disabled || html_options[:disabled]
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

    def initialize_component_html_data
      component_html_data
      popover_data_html
      tooltip_data_html
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
