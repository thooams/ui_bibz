module UiBibz::Ui::Core

  # Creates a connected component of the given +name+ using options created by the set of +options+.
  #
  # ==== Attributes
  #
  # * +content+ -   Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Component.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Component.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Component.new(content, { type: :success, glyph: 'eye' }, { class: 'test' })
  #   # or
  #   UiBibz::Ui::Core::Component.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end
  #
  class ConnectedComponent < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      super
    end

    protected

    def refresh_render
      content_tag :div, class: 'input-group field-refresh' do
        concat select_tag content, options[:option_tags], html_options
        concat refresh_btn_html
      end
    end

    def component_html_data
      connect_options
    end

    private

    def connect_opts
      selector = options[:refresh][:target][:selector]
      options[:refresh][:target][:selector] = selector.blank? ? "##{ content.to_s.parameterize.underscore }" : selector
      options[:refresh]
    end

    def refresh_btn_html
      content_tag(:span, UiBibz::Ui::Core::Forms::Buttons::ButtonRefresh.new('', connect: connect_opts).render, class: 'input-group-btn')
    end

    def connect_options
      add_html_data('connect', options[:connect]) if options[:connect]
    end

  end
end
