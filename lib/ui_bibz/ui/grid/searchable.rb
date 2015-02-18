module UiBibz::Ui
  class Searchable < Ui

    def initialize store, options
      @store   = store
      @options = options
    end

    def render
      content_tag :div do
        concat content_tag(:div, "#{ @store.controller.humanize } list", class: 'title')
        concat search_field_html if searchable?
        concat tag :br, class: 'clear'
      end
    end

    def searchable?
      @options[:searchable].nil? ? true : @options[:searchable]
    end

  private

    def search_field_html
      content_tag :div, class: 'input-group input-group-sm' do
        concat content_tag(:span, Glyph.new(name: 'search', size: 1).render, class: 'input-group-addon')
        concat tag(:input, type: 'search', value: @store.search, name: 'search', class: 'form-control', placeholder: 'Search...')
        concat content_tag(:span, Glyph.new(name: 'times-circle', size: 1).render, class: 'clear-search-btn input-group-addon')
      end
    end

  end
end
