module KlassExtension

  def join_classes *classes
    UiBibz::Utils::Screwdriver.join_classes classes
  end

  # Override this method to add a status class
  def status
  end

  private

  def initialize_component_html_classes
    cls = [
      html_options[:class],
      state,
      status,
      effect,
      options_classes,
      connect,
      component_html_classes
    ]
    html_options[:class] = join_classes(cls)
  end

  def effect
    options[:effect]
  end

  def options_classes
    options[:class] if options.kind_of?(Hash)
  end

  def state
    options[:state] unless options[:state].nil?
  end

  def connect
    "ui-bibz-connect" unless options[:connect].nil?
  end

end
