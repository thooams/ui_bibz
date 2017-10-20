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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:block)
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

    # See UiBibz::Ui::Core::Forms::Buttons::Button
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      button_link_html_tag
    end

  private

    def component_html_options
      opts = super
      opts = opts.merge({ role: "button" })
      opts
    end

    def button_link_html_tag
      link_to link_url, html_options do
        concat glyph_and_content_html
        concat badge_html unless options[:badge].nil?
      end
    end

    def link_url
      options[:url] || "#"
    end

    def status
      "btn-#{ options[:status] || :secondary }"
    end

  end
end
