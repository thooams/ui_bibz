# frozen_string_literal: true

# Class to valid status
class StatusValidator
  attr_reader :status, :value

  def initialize(status, value)
    @status = status
    @value = value
  end

  # Check if value is in status
  # Raise an error if not
  # @return [Void]
  def call
    return if value.nil?

    raise UiBibz::StatusError.new(value:, status:) unless status.include?(value.to_sym)
  end
end
