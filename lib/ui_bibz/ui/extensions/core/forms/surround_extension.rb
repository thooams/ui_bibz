module SurroundExtension

  private

  def surrounded?
    !options[:append].nil? || !options[:prepend].nil? || !options[:refresh].nil?
  end

  def surround_append_tag
    content_tag :span, options[:append], class: 'input-group-addon' unless options[:append].nil?
  end

  def surround_prepend_tag
    content_tag :span, options[:prepend], class: 'input-group-addon' unless options[:prepend].nil?
  end

  def surround_wrapper_class
  end

  def default_wrapper_class
    ['input-group', surround_size, surround_status]
  end

  def surround_wrapper_tag ct_tag
    content_tag :div, class: join_classes(default_wrapper_class, surround_wrapper_class) do
      concat surround_append_tag
      concat ct_tag
      concat surround_prepend_tag
    end
  end

  def surround_field field_tag
    surrounded? ? surround_wrapper_tag(field_tag) : field_tag
  end

  def surround_size
    "input-group-#{ options[:size] }" if options[:size]
  end

  def surround_status
    "has-#{ options[:status] }" if options[:status]
  end

end
