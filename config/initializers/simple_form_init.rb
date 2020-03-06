# frozen_string_literal: true

unless defined?(SimpleForm).nil?
  SimpleForm.setup do |config|
    # Namespaces where SimpleForm should look for custom input classes that
    # override default inputs.
    config.custom_inputs_namespaces << "UiBibzInputs"
  end
end
