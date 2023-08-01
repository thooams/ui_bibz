# frozen_string_literal: true

require 'test_helper'

class HtmlClassesBuilderTest < ActiveSupport::TestCase
  def setup
    @html_class_builder = HtmlClassesBuilder.new
  end

  test 'add class' do
    @html_class_builder.add 'test'

    assert_equal 'test', @html_class_builder.to_s
  end

  test 'remove class' do
    @html_class_builder.add 'test'
    @html_class_builder.remove 'test'

    assert_equal '', @html_class_builder.to_s
  end

  test 'to_s uniq' do
    @html_class_builder.add 'test'
    @html_class_builder.add 'test'

    assert_equal 'test', @html_class_builder.to_s
  end

  test 'return an array of string' do
    @html_class_builder.add 'test'
    @html_class_builder.add 'test2'

    assert_equal %w[test test2], @html_class_builder.to_a
  end

  test 'create status class' do
    @html_class_builder.add_composed 'test-%s', :success

    assert_equal 'test-success', @html_class_builder.to_s
  end

  test 'remove all duplicate classes' do
    @html_class_builder.add 'test'
    @html_class_builder.add %w[test test2]
    @html_class_builder.add 'test', 'test3'
    @html_class_builder.add 'test test4'

    assert_equal 'test test2 test3 test4', @html_class_builder.to_s
  end

  test 'add composed class' do
    @html_class_builder.add 'test'
    @html_class_builder.add_composed 'test-%s', :success

    assert_equal 'test test-success', @html_class_builder.to_s
  end
end
