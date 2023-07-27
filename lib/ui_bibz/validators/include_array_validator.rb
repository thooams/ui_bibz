# frozen_string_literal: true

module UiBibz::Validators
  # Class to valid status
  class IncludeArrayValidator
    attr_reader :array, :value

    def initialize(array, value)
      @array = array
      @value = value
    end

    # Check if value is in status
    # Raise an error if not
    # @return [Void]
    def validate
      return if value.nil?

      raise UiBibz::IncludeArrayError.new(value:, array:) unless array.include?(value.to_sym)
    end
  end
end
