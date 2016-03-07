module UiBibz::Ui::Core

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
  # * +prepend+ - String
  # * +append+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::SwitchField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::SwitchField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::SwitchField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::SwitchField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   switch_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SwitchField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      radio_button_tag content, value, options[:checked], html_options
    end

    private

    def value
      options[:value]
    end

    def component_html_classes
      "switch"
    end

    def component_html_data
      size
      status
      checked
      default_value
      animate
      readonly
      on_color
      off_color
      on_label
      off_label
      text_label
      label_icon
    end

    # '', 'mini', 'small', 'normal', 'large'
    def size
      add_html_data('size', matching_size[options[:size]]) unless options[:size].nil?
    end

    def matching_size
      { xs: 'small', md: 'normal', lg: 'large' }
    end

    def default_value
      #options[:default_value] unless options[:default_value].nil?
      add_html_data('default_value', options[:default_value]) unless options[:default_value].nil?
    end

    # true, false => default : true
    def checked
      add_html_data('checked') unless options[:checked].nil?
    end

    # true, false => default : true
    def animate
      add_html_data('animate') unless options[:animate].nil?
    end

    # true, false => default : false
    def status
      add_html_data('active', options.delete(:status)) unless options[:status].nil?
    end

    # true, false => default : false
    def readonly
      add_html_data('readonly') unless options[:readonly].nil?
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def on_state
      add_html_data('on', options[:on_state]) unless options[:on_state].nil?
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def off_state
      add_html_data('off', options[:off_state]) unless options[:off_state].nil?
    end

    # String => default : "ON"
    def on_label
      add_html_data('on_label', options[:on_label]) unless options[:on_label].nil?
    end

    # String => default : "OFF"
    def off_label
      add_html_data('off_label', options[:off_label]) unless options[:off_label].nil?
    end

    # String => default : '&nbsp;'
    def text_label
      add_html_data('text_label', options[:text_label]) unless options[:text_label].nil?
    end

    # String => default : nil
    def label_icon
      add_html_data('label_icon', options[:label_icon]) unless options[:label_icon].nil?
    end

  end
end
