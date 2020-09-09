# frozen_string_literal: true

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
  #   UiBibz::Ui::Core::Notifications::ToastHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::ToastHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::ToastHeader.new.render
  #
  #   UiBibz::Ui::Core::Notifications::ToastHeader.new do
  #     'Exemple'
  #   end.render
  #
  class ToastHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    def pre_render
      content_tag :div, html_options do
        concat UiBibz::Ui::Core::Icons::Glyph.new(options[:glyph], class: 'mr-2').render unless options[:glyph].nil?
        concat image_tag(options[:img], class: 'rounded mr-2') unless options[:img].nil?
        concat content_tag(:strong, content, class: 'mr-auto')
        concat content_tag(:small, options[:time], class: 'text-muted') unless options[:time].nil?
        concat close_button
      end
    end

    private

    def close_button
      content_tag :button, class: 'ml-2 mb-1 close', "data-dismiss": 'toast', "aria-label": 'Close' do
        content_tag(:span, '×', "aria-hidden": true).html_safe
      end
    end

    def component_html_classes
      'toast-header'
    end
  end
end
