# frozen_string_literal: true

module UiBibz::Ui::Ux::Tables
  class Paginable < UiBibz::Ui::Base
    include WillPaginate::ActionView

    def initialize(store, options, html_options = nil)
      @store        = store
      @options      = options
      @html_options = html_options
    end

    # Render html tag
    def render
      content_tag :div, @html_options do
        concat UiBibz::Ui::Ux::Tables::TablePagination.new(store: @store, wrap_form: @options[:wrap_form]).render
        concat UiBibz::Ui::Ux::Tables::TablePaginationPerPage.new(store: @store, wrap_form: @options[:wrap_form]).render
        concat tag(:br, class: 'ui-bibz-clear')
      end
    end

    def paginable?
      @options[:paginable].nil? ? true : @options[:paginable]
    end

    private

    def store
      @store ||= Store.new @search_field.options[:store]
    end
  end
end
