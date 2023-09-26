# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Choices
  # Create a SurroundField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # Source : http://www.bootstrap-switch.org/documentation-2.html
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
  # * +state+ - Symbol
  #   (+:active+, +:disabled+)
  # * +inline+ - Boolean
  # * +animate+ - Boolean
  # * +on_color+ - String
  # * +off_color+ - String
  # * +on_text+ - String
  # * +off_text+ - String
  # * +label_text+ - String
  # * +readonly+ - Boolean
  # * +checked+ - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::BoxSwitchField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::BoxSwitchField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   box_switch_field 'name', { on_color: :primary }, { readonly: true }
  #
  # ==== Helper
  #
  #   box_switch_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class BoxSwitchField < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      box_switch_field_html_tag
    end

    private

    def box_switch_field_html_tag
      content_tag :div, class: component_wrapper_html_classes do
        concat hidden_field_tag content, '0'
        concat check_box_tag content, '1', html_options[:checked], html_options
      end
    end

    def value
      options[:value]
    end

    def component_wrapper_html_classes
      join_classes('switch-field-container', inline)
    end

    def component_html_classes
      super << 'switch-field'
    end

    def component_html_data
      super
      size
      state
      animate
      left_color
      right_color
      left_text
      right_text
      middle_text
    end

    # '', 'mini', 'small', 'normal', 'large'
    def size
      @data_html_options_builder.add('size', value: matching_size[options[:size]])
    end

    def matching_size
      { sm: 'small', md: 'normal', lg: 'large' }
    end

    # true, false => default : true
    def animate
      @data_html_options_builder.add('animate', value: options.delete(:animate)) unless options[:animate].nil?
    end

    # active, disabled => default : active
    def state
      html_options[:disabled] = true if options[:state] == 'disabled'
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def left_color
      @data_html_options_builder.add('on_color', value: options[:left_color])
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def right_color
      @data_html_options_builder.add('off_color', value: options[:right_color])
    end

    # String => default : "ON"
    def left_text
      @data_html_options_builder.add('on_text', value: options[:left_text])
    end

    # String => default : "OFF"
    def right_text
      @data_html_options_builder.add('off_text', value: options[:right_text])
    end

    # String => default : '&nbsp;'
    def middle_text
      @data_html_options_builder.add('label_text', value: options[:middle_text])
    end

    def inline
      'btn-group' unless options[:inline].nil?
    end
  end
end
