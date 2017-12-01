if defined?(SimpleForm)
  SimpleForm.setup do |config|
    # Namespaces where SimpleForm should look for custom input classes that
    # override default inputs.
    config.custom_inputs_namespaces << "UiBibzInputs"
  end
end

Rails.application.config.autoload_paths += Dir[File.join(Rails.root, "app", "ui", "**", "*.rb")].each {|l| require l }
