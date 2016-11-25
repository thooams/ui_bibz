module UiBibz::Ui::Core::Inputs::Choices

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
  #   UiBibz::Ui::Core::Inputs::CheckboxField.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Inputs::CheckboxField.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Inputs::CheckboxField.new(content, { status: :success, type: :circle },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Inputs::CheckboxField.new({ status: :primary }, { class: 'test' }) do
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
    def render
      check_box_tag content, options[:value], options[:checked] || false, html_options
    end

  private

    def status
      "abc-checkbox-#{ options[:status] || :default  }"
    end

    def type
      "abc-checkbox-circle" unless options[:type].nil?
    end

    def component_html_classes
      [type]
    end

  end
end
