# frozen_string_literal: true

require 'ui_bibz/utils/internationalization'
module UiBibz::Ui
  class Base
    include ActionView::Helpers
    include Rails.application.routes.url_helpers

    attr_accessor :output_buffer

    # To know if translation missing
    def i18n_set?(key)
      I18n.t key, raise: true
    rescue StandardError
      false
    end

    # Add "id" in url to match with current record
    def inject_url(url, record)
      if defined?(record.uuid)
        url.gsub(%r{(/uuid/?)}, "/#{record.uuid}/")
      else
        url.gsub(%r{(/id/?)}, "/#{record.id}/")
      end
    end

    def generate_id(name = 'id')
      "#{name}-#{Random.rand(99_999)}"
    end
  end
end
