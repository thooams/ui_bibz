require 'will_paginate'
require "will_paginate-bootstrap"
module UiBibz::Ui
  class Paginable < Ui
    include WillPaginate::ActionView

    def initialize store, options
      @store   = store
      @options = options
    end

    def render
      content_tag :div do
        concat pagination_html
        concat per_page_html
        concat tag(:br, class: 'clear')
      end
    end

    def paginable?
      @options[:paginable].nil? ? true : @options[:paginable]
    end

  private

    def pagination_html
      will_paginate(@store.records, params: { controller: @store.controller },  renderer: BootstrapPagination::Rails)
    end

    def per_page_html
      content_tag :div, class: 'per-page' do
        concat results_count_html
        concat UiBibz::Utils::Internationalization.new("ui_bibz.table.pagination.per_page", default: "Per page: ").translate
        concat select_tag('per_page', options_for_select([25, 50, 100], @store.per_page), class: 'form-control')
      end
    end

    def results_count_html
      "#{ page_entries_info @store.records } | ".html_safe
    end

    def from_current_results
      @store.limit_value * @store.current_page - @store.limit_value + 1
    end

    def to_current_results
      @store.limit_value * @store.current_page
    end

  end
end
