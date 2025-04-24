# frozen_string_literal: true

require 'ui_bibz/ui/core/forms/choices/components/choice'
module UiBibz::Ui::Core::Forms::Choices
  # Create a choice group
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Choices::ButtonGroup
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
  # * +type+ - Symbol (+:checkbox+, +:radio+)
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new({ status: primary }, { class: 'lable-class'}) do |cg|
  #     cg.choice 'Choice 1'
  #     cg.choice 'Choice 2'
  #   end.render
  #
  # ==== Helper
  #
  #   ui_choice_group(options = {}, html_options = {}) do |cg|
  #     cg.choice content, options, html_options
  #     cg.choice content, options, html_options
  #   end
  #
  class ChoiceGroup < UiBibz::Ui::Core::Forms::Buttons::ButtonGroup
    include UiBibz::Ui::Concerns::HtmlConcern
    attr_reader :errors, :required_fields, :items

    # See UiBibz::Ui::Core::Forms::Choices::Button.initialize
    #
    def initialize(...)
      super
      @items = []
      @errors = []
      @required_fields = []
      @radio_name = @options[:name] || generate_id('choice')
    end

    def choice(content = nil, opts = nil, html_options = nil, &block)
      if block.nil?
        opts = @options.merge(opts || {})
      else
        content = @options.merge(content || {})
      end

      opts = opts.merge(name: @radio_name) if opts[:type] == :radio

      @items << Choice.new(content, opts, html_options, &block)
    end

    def input(attribute_name, options = {}, &)
      new_options = options.merge(old_label: options[:label], label: false, wrapper: false, error: false)
      new_options = new_options.merge(name: @radio_name, type: :radio) if @options[:type] == :radio

      @items << @options[:form].input(attribute_name, new_options, &)
      obj = @options[:form].object
      @errors << obj.errors[attribute_name] unless obj.errors[attribute_name].empty?
      @required_fields << obj._validators[attribute_name].try(:first).instance_of?(::ActiveRecord::Validations::PresenceValidator)
    end

    private

    def component_html_classes
      super << ['button-choice', 'btn-group-toggle', options.delete(:class)]
    end

    def component_html_options
      {}
    end

    def component_html_data
      @data_html_options_builder.add('toggle', value: 'buttons') if @options[:form].nil?
    end
  end
end
