module UiBibz::Ui::Core::Forms::Choices

  # Create a radio
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
  # * +value+ - String, Integer, Boolean [required]
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:success+, +:info+, +:warning+, +:danger+)
  # * +type+ - Symbol (:radio, :checkbox)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(content, { status: :success, type: :circle },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new({ status: :primary }, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   radio(content, options = {}, html_options = {})
  #
  #   radio(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class RadioField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, html_options.except(:id) do
        concat radio_button_tag content, options[:value], options[:checked] || false, checkbox_html_options
        concat label_tag label_name, label_content
      end
    end

  private

    def checkbox_html_options
      opts = {}
      opts = opts.merge({ disabled: true}) if options[:state] == :disabled
      opts
    end

    def label_name
      "#{ content }_#{ options[:value] }"
    end

    def label_content
      options[:label] || content
    end

    def status
      "abc-#{ type }-#{ options[:status] || :default  }"
    end

    def type
      if !options[:type].nil? && options[:type] == :square
        :checkbox
      else
        :radio
      end
    end

    def inline
      "#{ type }-inline" unless options[:inline].nil?
    end

    def component_html_classes
      [type, "abc-#{ type }", inline]
    end

  end
end
