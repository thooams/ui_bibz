# frozen_string_literal: true

module UiBibz::Ui::Concerns::NavigationConcern #:nodoc:
  extend ActiveSupport::Concern

  included do
    def spacer(num = 'auto')
      kls = " me-#{num}"
      @items.last.html_options[:class].nil? ? @items.last.html_options[:class] = kls : @items.last.html_options[:class] << kls
    end
  end
end
