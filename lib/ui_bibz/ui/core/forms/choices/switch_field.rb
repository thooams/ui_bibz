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
  # * +state+ - String
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
  #   UiBibz::Ui::Core::Forms::SwitchField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::SwitchField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   switch_field 'name', { on_color: :primary }, { readonly: true }
  #
  # ==== Helper
  #
  #   switch_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SwitchField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class: 'switch-field-container' do
        concat hidden_field_tag content, '0'
        concat check_box_tag content, '1', html_options[:checked], html_options
      end
    end

    private

    def value
      options[:value]
    end

    def component_html_classes
      "switch-field"
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
      add_html_data('size', matching_size[options[:size]]) unless options[:size].nil?
    end

    def matching_size
      { xs: 'small', md: 'normal', lg: 'large' }
    end

    # true, false => default : true
    def animate
      add_html_data('animate', options.delete(:animate)) unless options[:animate].nil?
    end

    # active, disabled => default : active
    def state
      html_options[:disabled] = true if options[:state] == 'disabled'
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def left_color
      add_html_data('on_color', options[:left_color]) unless options[:left_color].nil?
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def right_color
      add_html_data('off_color', options[:right_color]) unless options[:right_color].nil?
    end

    # String => default : "ON"
    def left_text
      add_html_data('on_text', options[:left_text]) unless options[:left_text].nil?
    end

    # String => default : "OFF"
    def right_text
      add_html_data('off_text', options[:right_text]) unless options[:right_text].nil?
    end

    # String => default : '&nbsp;'
    def middle_text
      add_html_data('label_text', options[:middle_text]) unless options[:middle_text].nil?
    end

  end
end
