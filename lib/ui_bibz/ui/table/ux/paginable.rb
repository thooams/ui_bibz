module UiBibz::Ui
  class Paginable < Ui
    include WillPaginate::ActionView

    def initialize store, options
      @store   = store
      @options = options
    end

    def render
      content_tag :div do
        concat UiBibz::Ui::TablePagination.new({ store: @store }).render
        concat per_page_html
        concat tag(:br, class: 'clear')
      end
    end

    def paginable?
      @options[:paginable].nil? ? true : @options[:paginable]
    end

  private

    def store
      @store ||= if @search_field.options[:store].nil?
        raise 'Store is nil!'
      elsif @search_field.options[:store].try(:records).nil?
        raise 'Store can be created only with "table_search_pagination" method!'
      else
        Store.new @search_field.options.delete :store
      end
    end

    def per_page_html
      content_tag :div, class: 'per-page' do
        concat results_count_html
        concat UiBibz::Utils::Internationalization.new("ui_bibz.table.pagination.per_page", default: "Per page: ").translate
        concat select_tag('per_page', options_for_select([25, 50, 100], store.per_page), class: 'form-control')
      end
    end

    def results_count_html
      "#{ page_entries_info store.records } | ".html_safe
    end

    def from_current_results
      store.limit_value * store.current_page - store.limit_value + 1
    end

    def to_current_results
      store.limit_value * store.current_page
    end

  end
end
