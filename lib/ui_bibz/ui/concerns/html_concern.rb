# frozen_string_literal: true

module UiBibz::Ui::Concerns::HtmlConcern # :nodoc:
  extend ActiveSupport::Concern

  included do
    def html(content = nil, &block)
      if block.nil?
        @items << RenderString.new(content)
      else
        context = eval('self', block.binding) # rubocop:disable Style/EvalWithLocation
        @items << RenderString.new(context.capture(&block))
      end
    end
  end
end

class RenderString < SimpleDelegator
  def render
    self
  end
end
