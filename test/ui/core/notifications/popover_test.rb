# frozen_string_literal: true

require 'test_helper'
class PopoverTest < ActionView::TestCase
  setup do
    @parameters = { animation: true, container: "body", position: :left,
                    delay: 10, html: true, selector: false, template: "<b>",
                    trigger: "hover focus", fallbackPlacement: %w[top right],
                    boundary: 'clippingParents', title: "My title", offset: 2,
                    customClass: "test", popperConfig: "Mystring" }
  end

  test 'popover by hash' do
    actual   = UiBibz::Ui::Core::Notifications::Popover.new(@parameters.merge(content: "My Content")).render
    expected = { "data-bs-toggle" => "popover", "data-bs-content" => "My Content", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-title" => "My title", "data-bs-trigger" => "hover focus", "data-bs-offset" => 2, "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents", "data-bs-customClass" => "test", "data-bs-popperConfig" => "Mystring" }

    assert_equal expected, actual
  end

  test 'popover with content and options' do
    actual = UiBibz::Ui::Core::Notifications::Popover.new("My Content", @parameters).render

    expected = { "data-bs-toggle" => "popover", "data-bs-content" => "My Content", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-title" => "My title", "data-bs-trigger" => "hover focus", "data-bs-offset" => 2, "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents", "data-bs-customClass" => "test", "data-bs-popperConfig" => "Mystring" }

    assert_equal expected, actual
  end

  test 'popover with block and options' do
    actual = UiBibz::Ui::Core::Notifications::Popover.new(@parameters) do
      "My Content"
    end.render

    expected = { "data-bs-toggle" => "popover", "data-bs-content" => "My Content", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-title" => "My title", "data-bs-trigger" => "hover focus", "data-bs-offset" => 2, "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents", "data-bs-customClass" => "test", "data-bs-popperConfig" => "Mystring" }

    assert_equal expected, actual
  end

  test 'glyph with popover object' do
    popover = UiBibz::Ui::Core::Notifications::Popover.new(@parameters.merge(content: "My Content"))
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", popover:).render
    expected = "<i data-bs-toggle=\"popover\" data-bs-content=\"My Content\" data-bs-placement=\"left\" data-bs-animation=\"true\" data-bs-container=\"body\" data-bs-delay=\"10\" data-bs-html=\"true\" data-bs-selector=\"false\" data-bs-template=\"<b>\" data-bs-title=\"My title\" data-bs-trigger=\"hover focus\" data-bs-offset=\"2\" data-bs-fallbackPlacement=\"top right\" data-bs-boundary=\"clippingParents\" data-bs-customClass=\"test\" data-bs-popperConfig=\"Mystring\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end

  test 'glyph with popover hash' do
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", popover: @parameters.merge(content: "My Content")).render
    expected = "<i data-bs-toggle=\"popover\" data-bs-content=\"My Content\" data-bs-placement=\"left\" data-bs-animation=\"true\" data-bs-container=\"body\" data-bs-delay=\"10\" data-bs-html=\"true\" data-bs-selector=\"false\" data-bs-template=\"<b>\" data-bs-title=\"My title\" data-bs-trigger=\"hover focus\" data-bs-offset=\"2\" data-bs-fallbackPlacement=\"top right\" data-bs-boundary=\"clippingParents\" data-bs-customClass=\"test\" data-bs-popperConfig=\"Mystring\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end

  test 'glyph with popover String' do
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", popover: "My Content").render
    expected = "<i data-bs-toggle=\"popover\" data-bs-content=\"My Content\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end
end
