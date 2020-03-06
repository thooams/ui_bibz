# frozen_string_literal: true

module UiBibz::Ui::Core::Layouts
  # Create a Container
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # * +type+ - Symbol (:fluid)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Layouts::Container.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Layouts::Container.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Layouts::Container.new(content, { type: :fluid },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Layouts::Container.new({ class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   container(content, options = {}, html_options = {})
  #
  #   container(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Container < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, content, html_options
    end

    private

    def component_html_classes
      type
    end

    def type
      options[:type] == :fluid ? 'container-fluid' : 'container'
    end
  end
end
