module UiBibz::Ui::Core::Forms::Buttons

  # Create a button
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
  # You can pass arguments in options attribute:
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:outline)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::Button.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::Button.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::Button.new('test', type: :primary, size: :xs).render
  #
  #   UiBibz::Ui::Core::Forms::Buttons::Button.new(type: :primary) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #  ui_button(content, options = {}, html_options = {})
  #
  #  ui_button(options = {}, html_options = {}) do
  #    content
  #  end
  class Button < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      button_html_tag
    end

  protected

    def button_html_tag
      content_tag :button, html_options do
        concat glyph_and_content_html
        concat badge_html unless options[:badge].nil?
      end
    end

    def component_html_classes
      super << ['btn', size, type]
    end

    def component_html_options
      opts = super
      opts = opts.merge({ role: "button" })
      opts = opts.merge(toggle)                   unless options[:toggle].nil?
      opts = opts.merge({ disabled: 'disabled' }) if options[:state] == :disabled
      opts
    end

    def status
      ["btn", outline, options[:status]].compact.join('-')
    end

    def outline
      "outline" unless options[:outline].nil?
    end

    def toggle
      { "data-toggle" => 'button', "aria-pressed" => false, "autocomplete" => "off" }
    end

    def active_html_options
      { "aria-pressed" => true }
    end

    def type
      "btn-block" if options[:type] == :block
    end

    def badge_html
      UiBibz::Ui::Core::Badge.new(options[:badge], status: (options[:status] || :secondary)).render
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ options[:size] }" if options[:size]
    end

  end
end
