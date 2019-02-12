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
  #   UiBibz::Ui::Core::Notifications::ToastBody.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::ToastBody.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::ToastBody.new.render
  #
  #   UiBibz::Ui::Core::Notifications::ToastBody.new do
  #     'Exemple'
  #   end.render
  #
  class ToastBody < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def pre_render
      content_tag :div, content, html_options
    end

  private

    def component_html_classes
      "toast-body"
    end

  end
end
