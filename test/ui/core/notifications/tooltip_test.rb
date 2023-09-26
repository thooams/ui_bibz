# frozen_string_literal: true

require 'test_helper'
class TooltipTest < ActionView::TestCase
  setup do
    @parameters = { animation: true, container: "body", position: :left,
                    delay: 10, html: true, selector: false, template: "<b>",
                    trigger: "hover focus", fallbackPlacement: %w[top right],
                    boundary: 'clippingParents' }
  end

  test 'tooltip by hash' do
    actual   = UiBibz::Ui::Core::Notifications::Tooltip.new(@parameters.merge(title: "My Title")).render
    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end

  test 'tooltip with content and options' do
    actual = UiBibz::Ui::Core::Notifications::Tooltip.new("My Title", @parameters).render

    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end

  test 'tooltip with block and options' do
    actual = UiBibz::Ui::Core::Notifications::Tooltip.new(@parameters) do
      "My Title"
    end.render

    expected = { "data-bs-toggle" => "tooltip", "data-bs-title" => "My Title", "data-bs-placement" => :left, "data-bs-animation" => true, "data-bs-container" => "body", "data-bs-delay" => 10, "data-bs-html" => true, "data-bs-selector" => false, "data-bs-template" => "<b>", "data-bs-trigger" => "hover focus", "data-bs-fallbackPlacement" => %w[top right], "data-bs-boundary" => "clippingParents" }

    assert_equal expected, actual
  end

  test 'glyph with tooltip object' do
    tooltip = UiBibz::Ui::Core::Notifications::Tooltip.new(@parameters.merge(title: "My Title"))
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", tooltip:).render
    expected = "<i data-bs-toggle=\"tooltip\" data-bs-title=\"My Title\" data-bs-placement=\"left\" data-bs-animation=\"true\" data-bs-container=\"body\" data-bs-delay=\"10\" data-bs-html=\"true\" data-bs-selector=\"false\" data-bs-template=\"<b>\" data-bs-trigger=\"hover focus\" data-bs-fallbackPlacement=\"top right\" data-bs-boundary=\"clippingParents\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end

  test 'glyph with tooltip hash' do
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", tooltip: @parameters.merge(title: "My Title")).render
    expected = "<i data-bs-toggle=\"tooltip\" data-bs-title=\"My Title\" data-bs-placement=\"left\" data-bs-animation=\"true\" data-bs-container=\"body\" data-bs-delay=\"10\" data-bs-html=\"true\" data-bs-selector=\"false\" data-bs-template=\"<b>\" data-bs-trigger=\"hover focus\" data-bs-fallbackPlacement=\"top right\" data-bs-boundary=\"clippingParents\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end

  test 'glyph with tooltip boolean' do
    actual = UiBibz::Ui::Core::Icons::Glyph.new("diamond", { tooltip: true }, { title: "My Title" }).render
    expected = "<i data-bs-toggle=\"tooltip\" data-bs-title=\"My Title\" class=\"glyph fa-solid fa-diamond\"></i>"

    assert_equal expected, actual
  end
end
