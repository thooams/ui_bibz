unless defined?(SimpleForm).nil?
  SimpleForm.setup do |config|
    # Namespaces where SimpleForm should look for custom input classes that
    # override default inputs.
    config.custom_inputs_namespaces << "UiBibzInputs"
  end
end

# no "require" in file in ui directory
#Rails.application.config.eager_load_paths += Dir[Rails.root.join("app", "ui", "**")]
