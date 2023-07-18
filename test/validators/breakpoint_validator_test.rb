# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/validators/breakpoint_validator'
require 'ui_bibz/errors/component_error'

class BreakpointValidatorTest < ActiveSupport::TestCase
  def setup
    @breakpoints = %i[xs md]
  end

  test 'call' do
    assert_nothing_raised do
      BreakpointValidator.new(@breakpoints, :xs).call
    end
  end

  test 'call with nil value' do
    assert_nothing_raised do
      BreakpointValidator.new(@breakpoints, nil).call
    end
  end

  test 'call with invalid value' do
    exception = assert_raises UiBibz::BreakpointError do
      BreakpointValidator.new(@breakpoints, :invalid).call
    end

    assert_equal "The breakpoint 'invalid' is not include in xs or md", exception.message
  end
end
