# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/validators/include_array_validator'
require 'ui_bibz/errors/component_error'
require 'ui_bibz/errors/include_array_error'

class IncludeArrayValidatorTest < ActiveSupport::TestCase
  def setup
    @array = %i[success primary]
  end

  test 'call' do
    assert_nothing_raised do
      IncludeArrayValidator.new(@array, :success).call
    end
  end

  test 'call with nil value' do
    assert_nothing_raised do
      IncludeArrayValidator.new(@array, nil).call
    end
  end

  test 'call with invalid value' do
    exception = assert_raises UiBibz::IncludeArrayError do
      IncludeArrayValidator.new(@array, :invalid).call
    end

    assert_equal "The value 'invalid' is not include in the list: success or primary", exception.message
  end
end
