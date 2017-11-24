module KlassExtension

  def join_classes *classes
    UiBibz::Utils::Screwdriver.join_classes classes
  end

  def exclude_classes arr, *classes
    UiBibz::Utils::Screwdriver.exclude_classes arr, classes
  end

  # Override this method to add a status class
  def status
  end

  def exclude_classes_in_html_options *classes
    html_options[:class] = exclude_classes html_options[:class], classes
  end

  private

  def initialize_component_html_classes
    cls = [
      original_html_options,
      state,
      status,
      effect,
      options_classes,
      connect,
      component_html_classes
    ]
    html_options[:class] = join_classes(cls)
  end

  def original_html_options
    transform_classes_to_array(html_options[:class])
  end

  def effect
    options[:effect]
  end

  def options_classes
    transform_classes_to_array(options[:class])
  end

  def state
    options[:state] unless options[:state].nil?
  end

  def connect
    "ui-bibz-connect" unless options[:connect].nil?
  end

  def transform_classes_to_array classes
    UiBibz::Utils::Screwdriver.uniq_word_in_string(classes.kind_of?(String) ? classes : classes.join(' ')) unless classes.nil?
  end

end
