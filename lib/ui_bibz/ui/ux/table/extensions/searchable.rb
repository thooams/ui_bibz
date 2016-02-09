module UiBibz::Ui::Ux
  class Searchable < UiBibz::Ui::Base

    def initialize store, options, html_options = nil
      @store        = store
      @options      = options
      @html_options = html_options
    end

    # Render html tag
    def render
      content_tag :div, @html_options do
        concat content_tag(:div, table_name, class: 'title')
        concat TableSearchField.new({ store: @store, wrap_form: false }).render if searchable?
        concat tag :br, class: 'ui-bibz-clear'
      end
    end

    def searchable?
      @options[:searchable].nil? ? true : @options[:searchable]
    end

  private

    def translate_searchable_attributes_by_active_record attr
      @store.model.human_attribute_name(attr)
    end

    def table_title
      if @options[:title] != false
        title = @options[:title] || "#{ @store.controller.humanize } list"
        UiBibz::Utils::Internationalization.new("ui_bibz.table.title.#{ model_name }", default: ["ui_bibz.table.title.defaults", title]).translate
      end
    end

    def model_name
      @store.model.to_s.underscore
    end

    def table_name
      "#{table_glyph}#{table_title}".html_safe
    end

    def table_glyph
      UiBibz::Ui::Core::Glyph.new(@options[:glyph]).render unless @options[:glyph].nil?
    end

  end
end
