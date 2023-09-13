# frozen_string_literal: true

require 'test_helper'

class DataHtmlOptionsBuilderTest < ActiveSupport::TestCase
  def setup
    @html_class_builder = UiBibz::Builders::DataHtmlOptionsBuilder.new({}, {})
  end

  test 'add key' do
    @html_class_builder.add 'test'
    expected = { data: { "test" => true } }

    assert_equal expected, @html_class_builder.output
  end

  test 'add key and value' do
    @html_class_builder.add 'test', value: 'test'
    expected = { data: { "test" => 'test' } }

    assert_equal expected, @html_class_builder.output
  end

  test 'add key with no value' do
    @html_class_builder.add 'test', value: nil
    expected = {}

    assert_equal expected, @html_class_builder.output
  end

  test 'add key with value at false' do
    @html_class_builder.add 'test', value: false
    expected = { data: { "test" => false } }

    assert_equal expected, @html_class_builder.output
  end
end
