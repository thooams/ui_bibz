require 'test_helper'
include UiBibz::Helpers

class ButtonRefreshTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Core::Forms::Buttons::ButtonRefresh.new('state', status: :success, connect: { target: { url: '/'}}).render
    expected = "<button data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}\" class=\"btn-success ui-bibz-connect input-refresh-button btn\"><i class=\"glyph fa fa-refresh\"></i> state</button>"

    assert_equal expected, actual
  end

end