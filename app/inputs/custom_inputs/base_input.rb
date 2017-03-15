module CustomInputs
  class BaseInput < SimpleForm::Inputs::Base

    def input(wrapper_options)
      super
    end

    def input_attribute_name
      "#{ @builder.object.class.to_s.underscore }[#{ attribute_name }]"
    end

  end
end
