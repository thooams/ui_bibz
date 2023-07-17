# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/validators/statuses_validator'
require 'ui_bibz/errors/component_error'

class StatusesValidatorTest < ActiveSupport::TestCase
  def setup
    @statuses = %i[success primary]
  end

  test 'call' do
    assert_nothing_raised do
      StatusesValidator.new(@statuses, :success).call
    end
  end

  test 'call with nil value' do
    assert_nothing_raised do
      StatusesValidator.new(@statuses, nil).call
    end
  end

  test 'call with invalid value' do
    exception = assert_raises UiBibz::StatusesError do
      StatusesValidator.new(@statuses, :invalid).call
    end

    assert_equal "The status 'invalid' is not include in success or primary", exception.message
  end
end
