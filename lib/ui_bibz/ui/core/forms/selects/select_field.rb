module UiBibz::Ui::Core::Forms::Selects

  # Create a SelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # source : http://silviomoreto.github.io/bootstrap-select/examples/
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
  # * +option_tags+ - Array, Object [required]
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +append+ - String, Html
  # * +prepend+ - String, Html
  # * +connect+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  # * +refresh+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  #
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new('fruits', { option_tags: list_of_fruits }, { class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new({ option_tags: list_of_fruits }, { class: 'test' }) do
  #     'fruits'
  #   end.render
  #
  # ==== Helper
  #
  #   select_field(content, options = {}, html_options = {})
  #
  class SelectField < UiBibz::Ui::Core::Forms::Selects::AbstractSelect

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    private

    def component_html_classes
      super << ["select-field", "form-control", "custom-select", size]
    end

    def component_options
      options[:status].nil? ? super : super.merge({ surrounded: true })
    end

    def size
      "custom-select-#{ options[:size] }" unless options[:size].nil?
    end

  end
end
