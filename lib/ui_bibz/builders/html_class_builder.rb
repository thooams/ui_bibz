# frozen_string_literal: true

# Class to build html classes
class HtmlClassBuilder
  def initialize
    @html_classes = []
  end

  # Add classes
  # @param [Array|String] classes
  # @return [Void]
  def add(*classes)
    @html_classes << classes
  end

  # Remove classes
  # @param [Array|String] classes
  # @return [Void]
  def remove(*classes)
    @html_classes = @html_classes.flatten.reject { |klass_name| Array(classes).flatten.include?(klass_name.to_s) || klass_name.blank? }
  end

  # To be sure to have uniq classes
  # @return [String] String of uniq classes
  def to_s
    to_a.join(' ')
  end

  # To be sure to have uniq classes
  # @return [Array] Array of uniq classes
  def to_a
    @html_classes.flatten.join(' ').split.uniq
  end

  # Create a status class
  # @param [String] class_name
  # @param [Symbol] status
  # @return [Void]
  def status(class_name, status)
    add class_name % status if status
  end
end
