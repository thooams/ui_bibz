module UiBibz::Ui::Core

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
  #   UiBibz::Ui::Core::Container.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Container.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Container.new(content, { type: :fluid },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Container.new({ class: 'test' }) do
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
  class Container < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, content, html_options
    end

  private

    def component_html_classes
      type
    end

    def type
      options[:type] == :fluid ? "container-fluid" : "container"
    end

  end
end
