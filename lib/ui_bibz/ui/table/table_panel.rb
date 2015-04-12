module UiBibz::Ui
  class TablePanel < Panel

    attr_accessor :columns

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @store        = @options.delete(:store) if @options[:store]
      table_options = (@options[:table_options] || {}).merge({ store: @store })
      @table        = UiBibz::Ui::Table.new(table_options, @options[:table_html_options])
    end

    def render
      initialize_header
      initialize_footer

      content_tag :div, class_and_html_options(panel_classes) do |f|
        form_tag(url_for(controller: @store.controller, action: @store.action), method: :get) do
          concat(header_html)   unless @header.nil?
          concat(body_html)     unless @body.nil?
          concat(@table.render) unless @store.nil?
          concat(footer_html)   unless @footer.nil?
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

    def panel_classes
      %w(panel panel-default table-panel)
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
