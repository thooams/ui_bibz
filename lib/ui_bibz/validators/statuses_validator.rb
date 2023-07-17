# frozen_string_literal: true

# Class to valid statuses
class StatusesValidator
  attr_reader :statuses, :value

  def initialize(statuses, value)
    @statuses = statuses
    @value = value
  end

  # Check if value is in statuses
  # Raise an error if not
  # @return [Void]
  def call
    return if value.nil?

    raise UiBibz::StatusesError.new(value:, statuses:) unless statuses.include?(value.to_sym)
  end
end
