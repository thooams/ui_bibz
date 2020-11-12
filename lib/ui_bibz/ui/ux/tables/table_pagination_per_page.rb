# frozen_string_literal: true

require 'ui_bibz/ui/ux/tables/components/store'
module UiBibz::Ui::Ux::Tables
  # Create a select pagination per page
  #
  # ==== Attributes
  #
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +store+ - Store generate by '+table_search_pagination+' method
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Tables::TablePaginationPerPage.new(store: @store)
  #
  # ==== Helper
  #
  #    table_pagination_per_page(options = {})
  #
  class TablePaginationPerPage < UiBibz::Ui::Base
    include WillPaginate::ActionView

    # Initialize per_page_field with component item
    # per_page_field require WillPaginate gem
    def initialize(options = nil, html_options = nil)
      @per_page_field = UiBibz::Ui::Core::Component.new nil, options, html_options
    end

    # Render html tag
    def render
      if @per_page_field.options[:wrap_form] == false
        per_page_html
      else
        form_tag(url_for(url_parameters), method: :get) do
          per_page_html_in_wrap
        end
      end
    end

    private

    def store
      raise 'Store is nil!' if @per_page_field.options[:store].nil?
      raise 'Store can be created only with "table_search_pagination" method!' if @per_page_field.options[:store].try(:records).nil?

      @store ||= Store.new @per_page_field.options[:store]
    end

    def url_parameters
      { controller: store.controller, action: store.action, id: store.param_id }
    end

    def per_page_html
      content_tag :div, class: 'table-pagination-per-page' do
        concat results_count_html
        concat UiBibz::Utils::Internationalization.new('ui_bibz.table.pagination.per_page', default: 'Per page: ').translate
        concat select_tag('per_page', options_for_select([5, 10, 20, 30, 50, 100, 200, 500], store.per_page), class: 'form-control')
      end
    end

    def per_page_html_in_wrap
      content_tag :div, class: 'table-pagination-per-page' do
        concat results_count_html
        concat UiBibz::Utils::Internationalization.new('ui_bibz.table.pagination.per_page', default: 'Per page: ').translate
        store.parameters.with_indifferent_access.reject { |k, v| default_parameters?(k) || v.blank? }.each do |k, v|
          concat tag(:input, type: 'hidden', name: k, value: v)
        end
        concat select_tag('per_page', options_for_select([5, 10, 20, 30, 50, 100, 200, 500], store.per_page), class: 'form-control')
        concat tag(:input, type: 'hidden', name: 'store_id', value: store.id) unless store.id.nil? # If there is more 1 table in html page
      end
    end

    def results_count_html
      "#{page_entries_info store.records} | ".html_safe
    end

    def from_current_results
      store.limit_value * store.current_page - store.limit_value + 1
    end

    def to_current_results
      store.limit_value * store.current_page
    end

    def default_parameters?(key)
      %w[store_id search controller action page link_type utf8].include?(key)
    end
  end
end
