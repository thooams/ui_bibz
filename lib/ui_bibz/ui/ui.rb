module UiBibz::Ui
  class Ui
    include ActionView::Helpers
    include Rails.application.routes.url_helpers

    attr_accessor :output_buffer
  end
end
