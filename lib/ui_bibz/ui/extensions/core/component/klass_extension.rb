# frozen_string_literal: true

module KlassExtension
  def join_classes(*classes)
    UiBibz::Builders::HtmlClassesBuilder.join_classes classes
  end

  def exclude_classes(arr, *classes)
    UiBibz::Builders::HtmlClassesBuilder.exclude_classes arr, classes
  end

  # Override this method to add a status class
  def status; end

  # TODO: Refactor
  # Not very clean but it's the only way to remove classes to html_options
  def exclude_classes_in_html_options(*classes)
    html_options[:class] = exclude_classes [html_options[:class], options[:classes]], classes
  end

  private

  def initialize_component_html_classes
    html_classes_builder = UiBibz::Builders::HtmlClassesBuilder.new
    html_classes_builder.add [
      html_options[:class],
      options[:class],
      state,
      status,
      effect,
      connect,
      component_html_classes
    ]
    html_options[:class] = html_classes_builder.output
  end

  def effect
    options[:effect]
  end

  def state
    options[:state] unless options[:state].nil?
  end

  def connect
    'ui-bibz-connect' unless options[:connect].nil?
  end
end
