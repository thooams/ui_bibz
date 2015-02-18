require "ui_bibz/ui/grid/paginable"
require "ui_bibz/ui/grid/searchable"
require "ui_bibz/ui/grid/sortable"
require "ui_bibz/ui/grid/actionable"
module UiBibz::Ui
  class Grid < Panel

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = (html_options || {}).merge({ class: 'grid' })
      @columns      = Columns.new
    end

    def columns &block
      @columns.tap(&block)
    end

    # Add :id in url to match with current record
    def actions &block
      context = eval("self", block.binding)
      @actions = context.capture(&block)
    end

    def render
      initialize_header
      initialize_footer

      content_tag(:div, { class: cls("panel panel-default") }) do |f|
        form_tag(url_for(controller: store.controller, action: store.action), method: :get) do
          concat(header_html) unless @header.nil?
          concat(body_html)   unless @body.nil?
          concat(table_html)  unless store.nil?
          concat(footer_html) unless @footer.nil?
        end
      end
    end

  private

    def sort
      @sort ||= Sortable.new store, @options
    end

    def action
      @action ||= Actionable.new store, @options, @actions
    end

    def pagination
      @pagination ||= Paginable.new store, @options
    end

    def search
      @search ||= Searchable.new store, @options
    end

    def store
      @store ||= if @options[:store].nil?
        raise 'Store is nil!'
      elsif @options[:store][:records].nil?
        raise 'Store can be created only with "grid_search_pagination" method!'
      else
        Store.new @options.delete :store
      end
    end

    def initialize_header
      @header = Component.new search.render
    end

    def initialize_footer
      @footer = Component.new(pagination.render) if pagination.paginable?
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

    def td_content record, col
      content = record.send(col.data_index)
      content = content.strftime(col.date_format)                    unless col.date_format.nil?
      content = link_to content, action.inject_url(col.link, record) unless col.link.nil?
      content
    end

  end
end
