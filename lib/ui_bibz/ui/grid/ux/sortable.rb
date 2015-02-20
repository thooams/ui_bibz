module UiBibz::Ui
  class Sortable < Ui

    def initialize store, options
      @store   = store
      @options = options
    end

    def header column, name = nil
      @column = column
      @name   = name || @column.name.titleize
      sortable? ? sortable_link : title
    end

  private

    def sortable_link
      link_to title.html_safe, url_options, { class: cls }
    end

    def url_options
      {
        controller: @store.controller,
        action:     @store.action,
        search:     @store.search,
        sort:       sort_name,
        direction:  direction
      }
    end

    def sortable?
      @options[:sortable].nil? ? true : @options[:sortable]
    end

    def title
      sortable? ? name_with_caret : @name
    end

    def name_with_caret
      sort_name == sort_column ? @name + caret : @name
    end

    def caret
      content_tag(:span, '', class: 'caret')
    end

    def cls
      sort_direction == 'asc' ? 'dropup' : nil
    end

    def direction
      sort_name == sort_column && sort_direction == "asc" ? "desc" : "asc"
    end

    def sort_column_name
      @column.sort.nil? ? "#{ @store.model.to_s.downcase.pluralize }.#{ @column.data_index}" : @column.sort
    end

    def sort_name
      @sort_name || sort_column_name
    end

    def sort_column
      @store.sort
    end

    def sort_direction
      %w[asc desc].include?(@store.direction) ? @store.direction : "asc"
    end

  end
end
