require "ui_bibz/ui/ux/table/components/store"
module UiBibz::Ui::Ux
  class TableSearchField < UiBibz::Ui::Base

    def initialize options = nil, html_options = nil
      @search_field = UiBibz::Ui::Core::Component.new nil, options, html_options
    end

    def render
      if @search_field.options[:wrap_form] != false
        form_tag(url_for(controller: store.controller, action: store.action), method: :get, class: 'form-table-search-field') do
          search_field_html
        end
      else
        search_field_html
      end
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

    def search_field_html
      content_tag :div, @search_field.class_and_html_options(div_class) do
        concat content_tag(:span, UiBibz::Ui::Core::Glyph.new('search').render, class: 'input-group-addon')
        concat tag(:input, type: 'search', value: store.search, name: 'search', class: 'form-control', placeholder: search_placeholder_field)
        concat content_tag(:span, UiBibz::Ui::Core::Glyph.new('times-circle').render, class: 'clear-search-btn input-group-addon')
      end
    end

    def div_class
      %w(input-group input-group-sm table-search-field)
    end

    def search_placeholder_field
      UiBibz::Utils::Internationalization.new('ui_bibz.grid.searchable.field.placeholder', searchable_attributes: searchable_attributes_sentence).translate
    end

    def searchable_attributes_sentence
      store.searchable_attributes.map do |i|
        UiBibz::Utils::Internationalization.new("ui_bibz.grid.searchable.field.searchable_attributes.#{ model_name }.#{ i }", default: [translate_searchable_attributes_by_active_record(i), i.to_s]).translate
      end.to_sentence(locale: I18n.locale)
    end

    def model_name
      store.model.to_s.underscore
    end

    def translate_searchable_attributes_by_active_record attr
      store.model.human_attribute_name(attr)
    end

  end
end
