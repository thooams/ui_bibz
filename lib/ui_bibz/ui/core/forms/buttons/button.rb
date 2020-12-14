# frozen_string_literal: true

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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +collapse+ - String
  # * +expand_collaspe+ - Boolean
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
    # Render html tag
    def pre_render
      button_html_tag
    end

    protected

    def button_html_tag
      content_tag :button, html_options do
        concat spinner_html unless options[:spinner].nil?
        concat glyph_and_content_html(@content)
        concat badge_html unless options[:badge].nil?
      end
    end

    def component_html_classes
      super << ['btn', size]
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
      # Must be flat hash not deep hash
      {
        "data-bs-toggle": :collapse,
        "data-bs-target": "##{options[:collapse]}",
        "aria-controls": options[:collapse],
        "aria-expanded": options[:expand_collapse].nil? ? false : options[:expand_collapse]
      }
    end

    def status
      ['btn', outline, options[:status] || 'secondary'].compact.join('-')
    end

    def outline
      'outline' unless options[:outline].nil?
    end

    def toggle
      { 'data-bs-toggle' => 'button', 'aria-pressed' => false, 'autocomplete' => 'off' }
    end

    def active_html_options
      { 'aria-pressed' => true }
    end

    def action
      add_html_data('action', value: options[:action]) unless options[:action].nil?
    end

    def badge_html
      if options[:badge].is_a? Hash
        options[:badge][:status] = options[:badge][:status] || options[:status] || :secondary
        UiBibz::Ui::Core::Notifications::Badge.new(options[:badge].delete(:content), options[:badge]).render

      else
        UiBibz::Ui::Core::Notifications::Badge.new(options[:badge], status: (options[:status] || :secondary)).render
      end
    end

    def spinner_html
      opts = { size: :sm, tag: :span, class: options[:text] == false ? nil : 'me-2' }
      opts = opts.merge(options[:spinner]) if options[:spinner].is_a? Hash

      UiBibz::Ui::Core::Notifications::Spinner.new(nil, opts).render
    end

    # :lg, :sm or :xs
    def size
      "btn-#{options[:size]}" if options[:size]
    end
  end
end
