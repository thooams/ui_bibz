# frozen_string_literal: true

module UiBibz::Builders
  # Class to build html classes
  class HtmlClassesBuilder
    class << self
      # Add class and return output
      # @param [Array|String] classes
      # @return [Array|nil] classes
      def join_classes(*)
        html_classes_builder = new
        html_classes_builder.add(*)
        html_classes_builder.output
      end

      # Remove classes and return output
      # @param [Array|String] arr
      # @param [Array|String] classes
      # @return [Array|nil] classes
      def exclude_classes(arr, *classes)
        html_classes_builder = new
        html_classes_builder.add(arr)
        html_classes_builder.remove(classes)
        html_classes_builder.output
      end
    end

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
      @html_classes = to_a.reject { |klass_name| self.class.join_classes(classes).include?(klass_name.to_s) }
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

    # Te be sure to have uniq classes
    # @return [Array|Nil] Array or nil
    def output
      to_a.empty? ? nil : to_a
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

    # Add class if value is equal to expected
    # @param [String] class_name
    # @param [Symbol|String] value
    # @param [Symbol|String] expected
    # @return [Void]
    def add_if_equal_value(class_name, value, expected)
      add class_name if value == expected
    end
  end
end
