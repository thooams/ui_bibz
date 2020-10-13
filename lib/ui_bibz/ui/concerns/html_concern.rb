# frozen_string_literal: true

module UiBibz::Ui::Concerns::HtmlConcern #:nodoc:
  extend ActiveSupport::Concern

  included do
    def html(content = nil, &block)
      if !block.nil?
        context = eval('self', block.binding) # rubocop:disable Style/EvalWithLocation
        @items << context.capture(&block)
      else
        @items << content
      end
    end
  end
end