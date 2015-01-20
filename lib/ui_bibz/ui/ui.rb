module UiBibz::Ui
  class Ui
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper

    attr_accessor :output_buffer
  end
end
