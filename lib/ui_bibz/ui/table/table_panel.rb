module UiBibz::Ui
  class TablePanel < Panel

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      super
      @store  = options[:store]
      @table  = UiBibz::Ui::Table.new(options, html_options)
    end

    def render
      initialize_header
      initialize_footer

      content_tag(:div, { class: cls("panel panel-default table-panel") }) do |f|
        form_tag(url_for(controller: @table.store.controller, action: @table.store.action), method: :get) do
          concat(header_html) unless @header.nil?
          concat(@table.render)  unless @table.store.nil?
          concat(footer_html) unless @footer.nil?
        end
      end
    end

    def columns &block
      @table.columns &block
    end

    def actions &block
      @table.actions &block
    end

  private

    def body_html
      content_tag :div, @body.render, { class: @body.cls("panel-body"), role: 'tabpanel' }.merge(@body.html_options)
    end

    def search
      @search ||= Searchable.new @store, @options
    end

    def pagination
      @pagination ||= Paginable.new @store, @options
    end

    def initialize_footer
      @footer = @table.pagination
    end

    def initialize_header
      @header = Component.new search.render
    end

    def initialize_footer
      @footer = Component.new(pagination.render) if pagination.paginable?
    end

  end
end
