# frozen_string_literal: true

require 'ui_bibz/ui/ux/tables/components/store'
module UiBibz::Ui::Ux::Tables
  class TableSearchField < UiBibz::Ui::Core::Component
    # Initialize search_field with component item
    def initialize(content = nil, options = nil, html_options = nil)
      html_options = options # rubocop:disable Lint/ShadowedArgument
      options = content
      content = nil
      super
    end

    # Render html tag
    def pre_render
      if options[:wrap_form] == false
        search_field_html
      else
        form_tag(url_for(url_parameters), method: :get, class: 'form-table-search-field') do
          search_field_html_in_wrap
        end
      end
    end

    private

    def url_parameters
      # { controller: store.controller, action: store.action, id: store.param_id }
      store.parameters
    end

    # Store must be generated by *table_search_pagination* method
    def store
      raise 'Store is nil!' if @options[:store].nil?
      raise 'Store can be created only with "table_search_pagination" method!' if @options[:store].try(:records).nil?

      @store ||= Store.new @options[:store]
    end

    def search_field_html
      # add surround_field maybe ?
      content_tag :div, html_options do
        concat content_tag(:span, UiBibz::Ui::Core::Icons::Glyph.new('search').render, class: 'input-group-text')
        concat tag(:input, type: 'search', value: search_content, name: 'search', class: 'form-control', placeholder: search_placeholder_field)
        concat tag(:input, type: 'hidden', name: 'link_type', value: 'search')
        concat content_tag(:span, UiBibz::Ui::Core::Icons::Glyph.new('times-circle').render, class: 'clear-search-btn input-group-text')
      end
    end

    def search_field_html_in_wrap
      content_tag :div, html_options do
        concat content_tag(:span, UiBibz::Ui::Core::Icons::Glyph.new('search').render, class: 'input-group-text')
        store.parameters.with_indifferent_access.reject { |k, _| default_parameters?(k) }.each do |k, v|
          concat tag(:input, type: 'hidden', name: k, value: v)
        end
        concat tag(:input, type: 'hidden', name: 'store_id', value: store.id) unless store.id.nil? # if there is more one table in html page
        concat tag(:input, type: 'hidden', name: 'link_type', value: 'search')
        concat tag(:input, type: 'search', value: search_content, name: 'search', class: 'form-control', placeholder: search_placeholder_field)
        concat clear_button
      end
    end

    def search_content
      if store.id.nil?
        store.search
      else
        store.id == store.params[:store_id] ? store.search : ''
      end
    end

    def clear_button
      content_tag :button, UiBibz::Ui::Core::Icons::Glyph.new('times-circle', text: false, label: 'Clear Search').render, type: :button, class: 'btn btn-secondary input-group-btn clear-search-btn'
    end

    def component_html_classes
      %w[input-group input-group-sm table-search-field]
    end

    def search_placeholder_field
      UiBibz::Utils::Internationalization.new('ui_bibz.grid.searchable.field.placeholder', searchable_attributes: searchable_attributes_sentence).translate
    end

    def searchable_attributes_sentence
      store.searchable_attributes.map do |i|
        attribute_name = underscorize_hash(i)
        UiBibz::Utils::Internationalization.new("ui_bibz.grid.searchable.field.searchable_attributes.#{model_name}.#{attribute_name}", default: [translate_searchable_attributes_by_active_record(attribute_name), attribute_name.to_s.humanize]).translate
      end.to_sentence(locale: I18n.locale)
    end

    def model_name
      store.model.to_s.underscore
    end

    def translate_searchable_attributes_by_active_record(attr)
      store.model.human_attribute_name(attr)
    end

    def underscorize_hash(attr)
      attr.is_a?(Hash) ? "#{attr.keys.first}_#{attr.values.first}".to_sym : attr
    end

    def default_parameters?(key)
      %w[store_id search controller action utf8 link_type].include?(key)
    end
  end
end
