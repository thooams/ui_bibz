# frozen_string_literal: true

module UiBibz::Ui::Ux::Tables
  class Sortable < UiBibz::Ui::Base

    def initialize store, options
      @store   = store
      @options = options
    end

    # header use i18n
    def header column, name = nil
      @column  = column
      defaults = [
        header_name(name),
        translate_headers_by_defaults,
        translate_headers_by_defaults_active_record,
        translate_headers_by_active_record,
        default_header_name(name)
      ].compact
      @name    = UiBibz::Utils::Internationalization.new(translate_headers_by_model, default: defaults).translate
      sortable? ? sortable_link : title
    end

  private

    def sortable_link
      link_to title.html_safe, url_for(url_options_o), { class: cls }
    end

    def header_name name
      name || @column.name
    end

    def default_header_name name
      name || @column.data_index.to_s.try('titleize')
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

    def url_options_o
      args =  {
        controller:  @store.controller,
        action:      @store.action,
        search:      @store.search,
        sort:        sort_name,
        column_id:   @column.id,
        direction:   direction,
        only_path:   true
      }
      args = args.merge({ id: @store.param_id }) if @store.param_id
      args = args.merge({ custom_sort: true, column_name: @column.data_index }) if @column.custom_sort
      args = args.merge({ parent: true }) if @column.parent
      args = args.merge({ store_id: @store.id }) unless @store.id.nil?
      args = args.merge({ link_type: 'column' })
      args = args.merge(@store.parameters.reject{ |k,v| default_parameters.include?(k.to_s) })
      args.with_indifferent_access
    end

    def default_parameters
      %w(column_id direction search store_id controller sort page per_page)
    end

    def sortable?
      @options[:sortable].nil? ? true : @options[:sortable]
    end

    def title
      sortable? ? name_with_caret : @name
    end

    def name_with_caret
      sort_name.to_s == sort_column.to_s && @column.id.to_s == @store.column_id.to_s ? @name + caret : @name
    end

    def caret
      UiBibz::Ui::Core::Icons::Glyph.new("caret-#{ direction == 'desc' ? 'up' : 'down' }").render
    end

    def cls
      sort_direction == 'asc' ? 'dropup' : nil
    end

    def direction
      sort_name == sort_column && sort_direction == "asc" ? "desc" : "asc"
    end

    def column_name
      @column.data_index || @column
    end

    def sort_column_name
      @column.sort.nil? ? "#{ @store.model.to_s.underscore.pluralize }.#{ @column.data_index}" : @column.sort
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
