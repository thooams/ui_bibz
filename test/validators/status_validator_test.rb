# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/validators/status_validator'
require 'ui_bibz/errors/component_error'

class StatusValidatorTest < ActiveSupport::TestCase
  def setup
    @status = %i[success primary]
  end

  test 'call' do
    assert_nothing_raised do
      StatusValidator.new(@status, :success).call
    end
  end

  test 'call with nil value' do
    assert_nothing_raised do
      StatusValidator.new(@status, nil).call
    end
  end

  test 'call with invalid value' do
    exception = assert_raises UiBibz::StatusError do
      StatusValidator.new(@status, :invalid).call
    end

    assert_equal "The status 'invalid' is not include in success or primary", exception.message
  end
end
