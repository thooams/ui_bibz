# frozen_string_literal: true

module UiBibz::Builders
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

    # Create a composed class
    # @param [String] class_name
    # @param [Symbol|String] value
    # @return [Void]
    def add_composed(class_name, value)
      add class_name % value if value
    end

    # Add class if value is not nil
    # @param [String] class_name
    # @param [Symbol|String] value
    # @return [Void]
    def add_not_nil(class_name, value)
      add class_name unless value.nil?
    end
  end
end
