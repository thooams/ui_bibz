module UiBibz::Ui
  class Searchable < Ui

    def initialize store, options
      @store   = store
      @options = options
    end

    def render
      content_tag :div do
        concat content_tag(:div, grid_name, class: 'title')
        concat search_field_html if searchable?
        concat tag :br, class: 'clear'
      end
    end

    def searchable?
      @options[:searchable].nil? ? true : @options[:searchable]
    end

  private

    def grid_title
      if @options[:title] != false
        title = @options[:title] || "#{ @store.controller.humanize } list"
        t("ui_bibz.grid.#{ @store.model.to_s.downcase }.title", default: [t("ui_bibz.grid.defaults.title"), title])
      end
    end

    def grid_name
      "#{grid_glyph}#{grid_title}".html_safe
    end

    def grid_glyph
      Glyph.new(@options[:glyph]).render unless @options[:glyph].nil?
    end

    def search_placeholder_field
      t('ui_bibz.grid.searchable.field.placeholder', searchable_attributes: searchable_attributes_sentence)
    end

    def searchable_attributes_sentence
      @store.searchable_attributes.map do |i|
        I18n.t("ui_bibz.grid.searchable.field.searchable_attributes.#{ @store.model.to_s.downcase }.#{ i }", default: [t("ui_bibz.searchable.field.searchable_attributes.defaults.#{ i }"), i.to_s])
      end.to_sentence(locale: I18n.locale)
    end

    def search_field_html
      content_tag :div, class: 'input-group input-group-sm' do
        concat content_tag(:span, Glyph.new(name: 'search', size: 1).render, class: 'input-group-addon')
        concat tag(:input, type: 'search', value: @store.search, name: 'search', class: 'form-control', placeholder: search_placeholder_field)
        concat content_tag(:span, Glyph.new(name: 'times-circle', size: 1).render, class: 'clear-search-btn input-group-addon')
      end
    end

  end
end
