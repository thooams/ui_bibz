# frozen_string_literal: true

module UiBibzInputs
  class StringInput < BaseInput
    enable :placeholder, :maxlength, :minlength, :pattern

    def input(wrapper_options = nil)
      unless string?
        input_html_classes.unshift('string')
        input_html_options[:type] ||= input_type if html5?
      end

      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      @builder.text_field(attribute_name, merged_input_options)
    end

    def options
      super.merge({ value: @builder.object.send(attribute_name) || super[:value] })
    end

    private

    def string?
      %i[string citext].include?(input_type)
    end
  end
end
