module UiBibzInputs
  class BaseInput < SimpleForm::Inputs::Base

    def input(wrapper_options)
      super
    end

    def options
      super.merge({ value: @builder.object.send(attribute_name)}).merge(@builder.options[:input_html] || {})
    end

    private

    def input_attribute_name
      "#{ @builder.object.class.name.gsub('::', "").underscore }[#{ attribute_name }]"
    end

  end
end
