module UiBibz::Ui::Core::Notifications::Components

  # Create a alert body
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
  # You can pass arguments in options attribute:
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::AlertBody.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::AlertBody.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::AlertBody.new.render
  #
  #   UiBibz::Ui::Core::Notifications::AlertBody.new do
  #     'Exemple'
  #   end.render
  #
  class AlertBody < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :p, content, html_options
    end

  private

    def component_html_classes
      "alert-body mb-0"
    end

  end
end
