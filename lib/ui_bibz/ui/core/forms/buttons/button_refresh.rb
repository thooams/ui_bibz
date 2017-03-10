module UiBibz::Ui::Core::Forms::Buttons

  # Create a Button Refrash
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
  # * +connect+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new('test', type: :primary, size: :xs).render
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(type: :primary) do
  #     test
  #   end.render
  #
  class ButtonRefresh < UiBibz::Ui::Core::Forms::Buttons::Button

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    private

    def component_options
      options[:connect] = cnt_opts
      { glyph: 'refresh', status: options[:status] }
    end

    def component_html_classes
      ['input-refresh-button', 'btn']
    end

    def cnt_opts
      {
        events: options[:connect].try(:[], :events) || "click",
        mode:   options[:connect].try(:[], :mode)   || "remote",
        target: {
          selector: options[:connect].try(:[], :target).try(:[], :selector) || "",
          url:      options[:connect].try(:[], :target).try(:[], :url)      || "",
          data:     options[:connect].try(:[], :target).try(:[], :data)     || []
        }
      }
    end

  end
end
