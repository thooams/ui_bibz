# frozen_string_literal: true

require 'test_helper'

class HtmlClassBuilderTest < ActiveSupport::TestCase
  def setup
    @html_class_builder = HtmlClassBuilder.new
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
end
