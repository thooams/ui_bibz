# frozen_string_literal: true

# Validator for breakpoint
class BreakpointValidator
  attr_reader :breakpoints, :value

  def initialize(breakpoints, value)
    @breakpoints = breakpoints
    @value = value
  end

  # Check if value is in brakepoints
  # Raise an error if not
  # @return [Void]
  def call
    return if value.nil?

    raise UiBibz::BreakpointError.new(value:, breakpoints:) unless breakpoints.include?(value.to_sym)
  end
end
