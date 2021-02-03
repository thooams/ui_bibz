# frozen_string_literal: true

require 'test_helper'
class TooltipTest < ActionView::TestCase
  setup do
    @parameters = { animation: true, container: "body", position: :left,
                    delay: 10, html: true, selector: false, template: "<b>",
                    trigger: "hover focus", fallback_placement: %w[top right],
                    boundary: 'clippingParents' }
  end

  test 'tooltip by hash' do
    actual   = UiBibz::Ui::Core::Notifications::Tooltip.new(@parameters.merge(title: "My Title")).render
    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-offset" => nil, "data-bs-fallback_placement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end

  test 'tooltip with content and options' do
    actual = UiBibz::Ui::Core::Notifications::Tooltip.new("My Title", @parameters).render

    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-offset" => nil, "data-bs-fallback_placement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end

  test 'tooltip with block and options' do
    actual = UiBibz::Ui::Core::Notifications::Tooltip.new(@parameters) do
      "My Title"
    end.render

    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-offset" => nil, "data-bs-fallback_placement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end
end
