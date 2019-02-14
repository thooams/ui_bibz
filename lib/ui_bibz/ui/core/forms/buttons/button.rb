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
    def pre_render
      button_html_tag
    end

  protected

    def button_html_tag
      content_tag :button, html_options do
        concat spinner_html unless options[:spinner].nil?
        concat glyph_and_content_html(options[:text].nil? ? @content : '')
        concat badge_html unless options[:badge].nil?
      end
    end

    def component_html_classes
      super << ['btn', size, type, without_text]
    end

    def component_html_options
      opts = super
      opts = opts.merge(toggle)                   unless options[:toggle].nil?
      opts = opts.merge(collapse)                 unless options[:collapse].nil?
      opts = opts.merge(active_html_options)      if options[:state] == :active
      opts = opts.merge({ disabled: 'disabled' }) if options[:state] == :disabled
      opts
    end

    def collapse
      attrs = { "data-toggle": "collapse", "data-target": "##{ options[:collapse] }" }
      attrs = attrs.merge({ "aria-expanded": true }) if options[:active_collapse]
      attrs
    end

    def status
      ["btn", outline, options[:status] || "secondary"].compact.join('-')
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

    def without_text
      "without-text" unless options[:text].nil?
    end

    def action
      add_html_data('action', options[:action]) unless options[:action].nil?
    end

    def badge_html
      if options[:badge].kind_of? Hash
        options[:badge][:status] = options[:badge][:status] || options[:status] || :secondary
        UiBibz::Ui::Core::Notifications::Badge.new(options[:badge].delete(:content), options[:badge]).render

      else
        UiBibz::Ui::Core::Notifications::Badge.new(options[:badge], status: (options[:status] || :secondary)).render
      end
    end

    def spinner_html
      opts = { size: :sm, tag: :span, class: options[:text] == false ? nil : 'mr-2' }
      opts = opts.merge(options[:spinner]) if options[:spinner].kind_of? Hash

      UiBibz::Ui::Core::Notifications::Spinner.new(nil, opts).render
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ options[:size] }" if options[:size]
    end

  end
end
