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
      if options[:builder].nil?
        check_box_tag content, value, options[:checked], html_options
      else
        options[:builder].check_box_tag content, html_options
      end
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
      animate
      readonly
      on_color
      off_color
      on_text
      off_text
      label_text
    end

    # '', 'mini', 'small', 'normal', 'large'
    def size
      add_html_data('size', matching_size[options[:size]]) unless options[:size].nil?
    end

    def matching_size
      { xs: 'small', md: 'normal', lg: 'large' }
    end

    # true, false => default : true
    def checked
      @options[:status] == :active ? { checked: :checked } : {}
    end

    # true, false => default : true
    def animate
      add_html_data('animate', options.delete(:animate)) unless options[:animate].nil?
    end

    # active, disabled => default : active
    def status
      ((options[:status] == 'disabled') & (!options[:status].nil?)) ? (add_html_option('disabled')) : (@options[:status] == :active)
    end

    # true, false => default : false
    def readonly
      ((options[:readonly] == true) & (!options[:readonly].nil?)) ? (add_html_option('readonly')) : ""
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def on_color
      add_html_data('on_color', options[:on_color]) unless options[:on_color].nil?
    end

    # 'primary', 'info', 'success', 'warning', 'danger', 'default' => default : default
    def off_color
      add_html_data('off_color', options[:off_color]) unless options[:off_color].nil?
    end

    # String => default : "ON"
    def on_text
      add_html_data('on_text', options[:on_text]) unless options[:on_text].nil?
    end

    # String => default : "OFF"
    def off_text
      add_html_data('off_text', options[:off_text]) unless options[:off_text].nil?
    end

    # String => default : '&nbsp;'
    def label_text
      add_html_data('label_text', options[:label_text]) unless options[:label_text].nil?
    end

  end
end
