require 'test_helper'

class MarkdownEditorFieldTest < ActionView::TestCase

    test 'markdown_editor' do
      actual = UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new('comments').render
      expected = "<textarea name=\"comments\" id=\"comments\" data-provide=\"markdown\" data-iconlibrary=\"fa\">
</textarea>"

      assert_equal expected, actual
    end
end
