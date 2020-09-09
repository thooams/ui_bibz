# frozen_string_literal: true

module UiBibzInputs
  class BaseInput < SimpleForm::Inputs::Base
    include ActionView::Helpers::FormTagHelper

    def options
      super.merge({ value: @builder.object.send(attribute_name) }).merge(@builder.options[:input_html] || {})
    end

    private

    def input_attribute_name
      new_attribute_name = @builder.lookup_model_names.first.to_s
      new_attribute_name += "[#{@builder.lookup_model_names.second}_attributes]" if @builder.lookup_model_names.second
      new_attribute_name + "[#{attribute_name}]"
    end
  end
end
