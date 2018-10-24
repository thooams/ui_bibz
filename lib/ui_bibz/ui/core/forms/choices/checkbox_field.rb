module UiBibz::Ui::Core::Forms::Choices

  # Create a checkbox
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
  # * +type+ - Symbol (:circle)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(content, { status: :success, type: :circle },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new({ status: :primary }, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   checkbox(content, options = {}, html_options = {})
  #
  #   checkbox(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class CheckboxField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      checkbox_field_html_tag
    end

  private

    def checkbox_field_html_tag
      options[:action] = html_options[:data].delete(:action)
      content_tag :div, html_options.except(:id, "data-action") do
        concat check_box_tag content, options[:value], options[:checked] || false, checkbox_html_options
        concat label_tag label_name, label_content, label_html_options
      end
    end

    def checkbox_html_options
      { class: 'form-check-input', disabled: options[:state] == :disabled, "data-action": options[:action] }
    end

    def label_name
      html_options[:id] || content
    end

    def label_html_options
      { class: join_classes("form-check-label", ("fix-label" if options[:label] == false)) }
    end

    def label_content
      case options[:label]
      when nil
        content
      when false
        " "
      else
        options[:label]
      end
    end

    def status
      "abc-checkbox-#{ options[:status] || :default  }"
    end

    def type
      "abc-checkbox-circle" unless options[:type].nil?
    end

    def indeterminate
      "indeterminate" unless options[:indeterminate].nil?
    end

    def inline
      "checkbox-inline" unless options[:inline].nil?
    end

    def component_html_classes
      super << ["form-check", "abc-checkbox", type, indeterminate, inline]
    end

  end
end
