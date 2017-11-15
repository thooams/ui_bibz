# encoding: UTF-8
require 'test_helper'

class ProgressBarTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'progress bar' do
    actual = ui_progress_bar(20)
    expected = "<div class=\"progress\"><div class=\"progress-bar\" aria-valuenow=\"20.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

  test 'progress bar status' do
    actual = ui_progress_bar(70, status: :danger)
    expected = "<div class=\"progress\"><div class=\"bg-danger progress-bar\" aria-valuenow=\"70.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 70.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

  test 'progress bar striped' do
    actual = ui_progress_bar(70, striped: true)
    expected = "<div class=\"progress\"><div class=\"progress-bar progress-bar-striped\" aria-valuenow=\"70.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 70.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

 test 'progress bar animated' do
    actual = ui_progress_bar(70, animated: true)
    expected = "<div class=\"progress\"><div class=\"progress-bar progress-bar-animated\" aria-valuenow=\"70.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 70.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

  test 'progress bar stacked' do
    actual = ui_progress_bar(76, animated: true)
    expected = "<div class=\"progress\"><div class=\"progress-bar progress-bar-animated\" aria-valuenow=\"76.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 76.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

  test 'progress bar custom' do
    actual = ui_progress_bar tap: true do |pb|
      pb.bar 25, status: :warning, striped: true
      pb.bar 65, status: :danger
    end
    expected = "<div class=\"progress\"><div class=\"bg-warning progress-bar progress-bar-striped\" aria-valuenow=\"25.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 25.0%\" role=\"progressbar\"></div><div class=\"bg-danger progress-bar\" aria-valuenow=\"65.0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 65.0%\" role=\"progressbar\"></div></div>"

    assert_equal expected, actual
  end

end
