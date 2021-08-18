# frozen_string_literal: true

module UiBibz::Ui::Concerns::NotificationConcern # :nodoc:
  extend ActiveSupport::Concern

  included do
    def data_attributes
      self.class.const_get('DATA_ATTRIBUTES').filter_map do |data_attribute|
        options[data_attribute].to_s.blank? ? nil : { "data-bs-#{data_attribute}" => data_attribute_value(data_attribute) }
      end.reduce(&:merge) || {}
    end
  end
end
