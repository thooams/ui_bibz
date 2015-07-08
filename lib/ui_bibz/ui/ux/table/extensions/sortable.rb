module UiBibz::Ui::Ux
  class Sortable < UiBibz::Ui::Base

    def initialize store, options
      @store   = store
      @options = options
    end

    def header column, name = nil
      @column  = column
      name     = name || @column.name.try('titleize')
      defaults = [translate_headers_by_defaults, translate_headers_by_defaults_active_record, translate_headers_by_active_record, name]
      @name    = UiBibz::Utils::Internationalization.new(translate_headers_by_model, default: defaults).translate
      sortable? ? sortable_link : title
    end

  private

    def sortable_link
      link_to title.html_safe, url_options, { class: cls }
    end

    def translate_headers_by_model
      "ui_bibz.grid.headers.#{ @store.model.to_s.underscore }.#{ @column.data_index }"
    end

    def translate_headers_by_defaults
      "ui_bibz.grid.headers.defaults.#{ @column.data_index }"
    end

    def translate_headers_by_defaults_active_record
      "activerecord.attributes.defaults.#{ @column.data_index }"
    end

    def translate_headers_by_active_record
      "activerecord.attributes.#{ @store.model.to_s.underscore }.#{ @column.data_index }"
    end

    def url_options
      args =  {
        controller: @store.controller,
        action:     @store.action,
        search:     @store.search,
        sort:       sort_name,
        direction:  direction
      }
      args = args.merge({ custom_sort: true, column_name: @column.data_index }) if @column.custom_sort
      args = args.merge({ parent: true }) if @column.parent
      args
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
