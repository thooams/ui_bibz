module UiBibz::Ui::Ux
  class Paginable < UiBibz::Ui::Base
    include WillPaginate::ActionView

    def initialize store, options
      @store   = store
      @options = options
    end

    # Render html tag
    def render
      content_tag :div do
        concat UiBibz::Ui::Ux::TablePagination.new(@options.merge({ store: @store })).render
        concat UiBibz::Ui::Ux::TablePaginationPerPage.new(@options.merge({ store: @store })).render
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
