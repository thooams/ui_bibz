module UiBibz::Ui::Ux::Tables
  class Paginable < UiBibz::Ui::Base
    include WillPaginate::ActionView

    def initialize store, options, html_options = nil
      @store        = store
      @options      = options
      @html_options = html_options
    end

    # Render html tag
    def render
      content_tag :div, @html_options do
        concat UiBibz::Ui::Ux::Tables::TablePagination.new(store: @store).render
        concat UiBibz::Ui::Ux::Tables::TablePaginationPerPage.new(store: @store).render
        concat tag(:br, class: 'ui-bibz-clear')
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

  end
end
