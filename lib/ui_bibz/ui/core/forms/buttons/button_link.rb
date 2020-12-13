# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Buttons
  # Create a button link
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Buttons::Button.
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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new('test', type: :primary, url: '#')
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new(type: :primary, url: '#') do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #   ui_button_link(content, options = {}, html_options = {})
  #
  #   ui_button_link(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonLink < UiBibz::Ui::Core::Forms::Buttons::Button
    # Render html tag
    def pre_render
      button_link_html_tag
    end

    private

    def button_link_html_tag
      link_to link_url, html_options do
        concat spinner_html unless options[:spinner].nil?
        concat glyph_and_content_html(@content)
        concat badge_html unless options[:badge].nil?
      end
    end

    def link_url
      options[:url] || "##{options[:collapse]}"
    end

    def component_html_options
      super.merge({ role: :button })
    end

    def collapse
      # Must be flat hash not deep hash
      {
        "data-bs-toggle": :collapse,
        "aria-controls": options[:collapse],
        "aria-expanded": options[:expand_collaspe].nil? ? false : options[:expand_collaspe]
      }
    end
  end
end
