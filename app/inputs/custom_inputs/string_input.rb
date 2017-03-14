module CustomInputs
  class StringInput < SimpleForm::Inputs::StringInput

    def input(wrapper_options)
      super
    end

    def new_options
      @options.merge({ builder: @builder })
    end

    def input_attribute_name
      "#{ @builder.object.class.to_s.parameterize.underscore }[#{ attribute_name }]"
    end

  end
end
