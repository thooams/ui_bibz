module UiBibz::Ui
  class Ui
    include ActionView::Helpers
    include Rails.application.routes.url_helpers

    attr_accessor :output_buffer

    # To know if translation missing
    def i18n_set? key
      I18n.t key, :raise => true rescue false
    end
  end
end
