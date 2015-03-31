require "ui_bibz/ui/table"
module UiBibz::Ui
  class TablePanel < Panel

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = (html_options || {}).merge({ class: 'table' })
      @table        = UiBibz::Table.new(store: options[:store])
    end

    def render
      initialize_header
      initialize_footer
      initialize_body

      content_tag(:div, { class: cls("panel panel-default") }) do |f|
        form_tag(url_for(controller: @table.store.controller, action: @table.store.action), method: :get) do
          concat(header_html) unless @header.nil?
          concat(body_html)   unless @table.store.nil?
          concat(footer_html) unless @footer.nil?
        end
      end
    end

  private

    def body_html
      content_tag :div, @body.render, { class: @body.cls("panel-body"), role: 'tabpanel' }.merge(@body.html_options)
    end

    def initialize_header
      @header = @table.search_field
    end

    def initialize_footer
      @footer = @table.pagination
    end

    def initialize_body
      @body = Component.new @table.body
    end

  end
end
