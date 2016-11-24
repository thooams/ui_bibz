module UiBibz::Ui::Core::Inputs::Selects

  # Create a MultiSelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Inputs::Buttons::Button
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
  # * option_tags - Array, Object [required]
  # * clickable_opt_group - Boolean
  # * collapsible_opt_group - Boolean
  # * searchable - Boolean
  # * select_all_option - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Inputs::Selects::MultiSelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Inputs::Selects::MultiSelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Inputs::Selects::MultiSelectField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Inputs::Selects::MultiSelectField.new({ option_tags: list_of_fruits, select_all_option: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   multi_select_field(content, options = {}, html_options = {})
  #
  class MultiSelectField < UiBibz::Ui::Core::Inputs::Buttons::Button

    # See UiBibz::Ui::Core::Inputs::Buttons::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      select_tag content, options[:option_tags], html_options
    end

    private

    def component_html_options
      { multiple: true }.merge(options[:state] == :disabled ? { disabled: 'disabled' } : {})
    end

    def component_html_classes
      ['btn', size, type, 'multi-select']
    end

    def component_html_data
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

  end
end
