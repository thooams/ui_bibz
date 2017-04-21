module UiBibz::Ui::Core::Forms::Selects

  # Create a MultiSelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Buttons::Button
  # source : http://loudev.com/
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
  # * +option_tags+ - Array, Object [required]
  # * +clickable_opt_group+ - Boolean
  # * +collapsible_opt_group+ - Boolean
  # * +searchable+ - Boolean
  # * +select_all_option+ - Boolean
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
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new({ option_tags: list_of_fruits, select_all_option: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   multi_select_field(content, options = {}, html_options = {})
  #
  class MultiSelectField < UiBibz::Ui::Core::Forms::Buttons::Button

    # See UiBibz::Ui::Core::Forms::Buttons::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      multi_select_field_html_tag
    end

    private

    def multi_select_field_html_tag
      if options[:refresh]
        refresh_render
      else
        select_tag content, options[:option_tags], html_options
      end
    end

    def component_html_options
      opts = { include_blank: false, prompt: false, multiple: true }
      opts = opts.merge({ disabled: true }) if options[:state] == :disabled
      opts
    end

    def component_html_classes
      [size, type, status, 'multi-select-field']
    end

    def component_html_data
      super
      clickable_opt_group
      collapsible_opt_group
      searchable
      select_all_option
    end

    def clickable_opt_group
      add_html_data('enable_clickable_opt_groups') if options[:clickable_opt_group]
    end

    def collapsible_opt_group
      add_html_data('enable_collapsible_opt_groups') if options[:collapsible_opt_group]
    end

    def searchable
      add_html_data('enable_filtering') if options[:searchable]
    end

    def select_all_option
      add_html_data('include_select_all_option') if options[:select_all_option]
    end

    def status
      options[:status].nil? ? 'btn-secondary' : "btn-#{ options[:status] }"
    end

    def connect_opts
      selector = options[:refresh][:target][:selector]
      options[:refresh][:target][:selector] = selector.blank? ? "##{ content.to_s.parameterize.underscore }" : selector
      options[:refresh]
    end

  end
end
