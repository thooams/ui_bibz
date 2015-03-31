require "ui_bibz/ui/table/components/store"
require "ui_bibz/ui/table/components/columns"
require "ui_bibz/ui/table/components/column"
require "ui_bibz/ui/table/ux/paginable"
require "ui_bibz/ui/table/ux/paginable"
require "ui_bibz/ui/table/ux/searchable"
require "ui_bibz/ui/table/ux/sortable"
require "ui_bibz/ui/table/ux/actionable"
module UiBibz::Ui
  class Table < Panel

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = (html_options || {}).merge({ class: 'table' })
      @columns      = Columns.new
    end

    def columns &block
      @columns.tap(&block)
    end

    # Add :id in url to match with current record
    #
    # ==== Signatures
    #
    #   table.actions do
    #     = link_action 'Show', users_path(:id), glyph: 'eye'
    #     = "---" # for divider
    #     = link_action 'delete', users_path(:id), method: :delete, glyph: 'trash'
    #   end
    #
    def actions &block
      context = eval("self", block.binding)
      @actions = context.capture(&block)
    end

    def render
      Component.new table_html
    end

    def search_field
      Searchable.new store, @options
      Component.new @table.search_field
    end

    def pagination
      paginable = Paginable.new store, @options
      Component.new(paginable.render) if paginable.paginable?
    end

  private

    def body_html
      content_tag :div, @body.render, { class: @body.cls("panel-body"), role: 'tabpanel' }.merge(@body.html_options)
    end

    def sort
      @sort ||= Sortable.new store, @options
    end

    def action
      @action ||= Actionable.new store, @options, @actions
    end

    def store
      @store ||= if @options[:store].nil?
        raise 'Store is nil!'
      elsif @options[:store].try(:records).nil?
        raise 'Store can be created only with "table_search_pagination" method!'
      else
        Store.new @options.delete :store
      end
    end

    def cols
      @columns.list.empty? ? store.columns.list : @columns.list
    end

    def table_html
      content_tag :table, class: 'table table-hover' do

        ths = cols.collect do |col|
          content_tag(:th, sort.header(col)) unless col.hidden?
        end

        ths = action.header ths
        concat content_tag(:tr, ths.join.html_safe)

        store.records.each do |record|
          tds = cols.collect do |col|
            content_tag(:td, td_content(record, col)) unless col.hidden?
          end

          tds = action.body record, tds
          concat content_tag :tr, tds.join.html_safe
        end
      end
    end

    # Maybe create a class for td_content
    def td_content record, col
      content = col.count ? record.send(col.data_index).count : record.send(col.data_index)
      unless content.nil?
        content = content.strftime(col.date_format)                    unless col.date_format.nil?
        content = link_to content, action.inject_url(col.link, record) unless col.link.nil?
        content = col.format.call(@store.records, record)              unless col.format.nil?
        content
      end
    end

  end
end
