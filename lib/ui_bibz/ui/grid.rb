require 'will_paginate'
require "will_paginate-bootstrap"
module UiBibz::Ui
  class Grid < Panel
    include WillPaginate::ActionView

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = (html_options || {}).merge({ class: 'grid' })
      @columns      = Columns.new
      initialize_store
      initialize_sortable
      initialize_pagination
      initialize_header
    end

    def columns &block
      @columns.tap(&block)
    end

    def pagination args
      @pagination = will_paginate(@store.records, args) if paginable?
    end

    # Add :id in url to match with current record
    def actions &block
      context = eval("self", block.binding)
      @actions = context.capture(&block)
    end

    def render
      content_tag(:div, { class: cls("panel panel-default") }) do |f|
        form_tag(url_for(controller: @store.controller, action: @store.action), method: :get) do
          concat(header_html) unless @header.nil?
          concat(body_html)   unless @body.nil?
          concat(table_html)  unless @store.nil?
          concat(footer_html) unless @footer.nil?
        end
      end
    end

  private

    def initialize_sortable
      @sortable = Sortable.new @store, @options
    end

    def sortable column, name = nil
      name ||= column.titleize
      title = name
      css_class = sort_direction == 'asc' ? 'dropup' : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      if sortable?
        title = title + content_tag(:span, '', class: 'caret') if column == sort_column
        link_to title.html_safe, { sort: column, controller: @store.controller, action: @store.action, search: @store.search, direction: direction }, {:class => css_class}
      else
        title
      end
    end

    def sort_column_name column
      column.sort.nil? ? "#{ @store.model.to_s.downcase.pluralize }.#{ column.data_index}" : column.sort
    end

    def sort_column
      @store.sort
    end

    def sort_direction
      %w[asc desc].include?(@store.direction) ? @store.direction : "asc"
    end

    # to fix form_for
    def protect_against_forgery?
      false
    end

    def actionable?
      @options[:actionable] || true
    end

    def searchable?
      @options[:searchable] || true
    end

    def paginable?
      @options[:pagination] || true
    end

    def sortable?
      @options[:sortable] || true
    end

    def initialize_store
      if @options[:store].nil?
        raise 'Store is nil!'
      else
        @store = Store.new @options[:store]
      end
    end

    def initialize_header
      @header = Component.new do
        concat content_tag(:div, "#{ @store.controller.humanize } list", class: 'title')
        concat search_field_html
        concat tag :br, class: 'clear'
      end
    end

    def initialize_pagination
      unless @store.nil?
        if paginable?
          # Add controller to fix error: ArgumentError: arguments passed to url_for can't be handled.
          pagination_html = will_paginate(@store.records, params: { controller: @store.controller },  renderer: BootstrapPagination::Rails)
          @footer = Component.new do
            concat pagination_html
            concat per_page_html
            concat tag(:br, class: 'clear')
          end
        end
      end
    end

    def search_field_html
      content_tag :div, class: 'input-group input-group-sm' do
        concat content_tag(:span, Glyph.new(name: 'search', size: 1).render, class: 'input-group-addon')
        concat tag(:input, type: 'search', value: @store.search, name: 'search', class: 'form-control', placeholder: 'Search...')
        concat content_tag(:span, Glyph.new(name: 'times-circle', size: 1).render, class: 'clear-search-btn input-group-addon')
      end
    end

    def per_page_html
      content_tag :div, class: 'per-page' do
        concat "Per page: "
        concat select_tag('per_page', options_for_select([25, 50, 100], @store.per_page), class: 'form-control')
      end
    end

    def default_actions record
      capture do
        glyph = Glyph.new(name: 'eye', type: 'fw').render
        name  = "#{ glyph } Show".html_safe
        concat link_to name, { controller: @store.controller, action: 'show', id: record.id }, role: "menuitem",  tabindex: "-1"
        glyph = Glyph.new(name: 'pencil', type: 'fw').render
        name  = "#{ glyph } Edit".html_safe
        concat link_to name, { controller: @store.controller, action: 'edit', id: record.id }, role: "menuitem",  tabindex: "-1"
        glyph = Glyph.new(name: 'trash', type: 'fw').render
        name  = "#{ glyph } Delete".html_safe
        concat link_to name, { controller: @store.controller, id: record.id }, method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
      end
    end

    def custom_actions record
      @actions.split("\n").compact.map{ |l| inject_url(l, record) }.join().html_safe unless @actions.nil?
    end

    def inject_url url, record
      url.gsub(/(\/id\/?)/, "/#{ record.id }/")
    end

    def dropdown_action record
      # TODO: Fix links without eval

      Dropdown.new 'Action', { position: :right, glyph: { name: 'ellipsis-v', size: 1, type: 'fw' }}, class: 'btn-group-xs' do |d|
        actions = custom_actions(record) || default_actions(record)
        content_tag :li, actions, role: 'presentation'
      end.render
    end

    def table_html
      content_tag :table, class: 'table table-hover' do
        columns = @columns.list.empty? ? @store.columns.list : @columns.list

        ths = columns.collect do |column|
          content_tag(:th, @sortable.header(column)) unless column.hidden?
        end

        ths << content_tag(:th, '', class: 'action') if actionable?
        concat content_tag(:tr, ths.join.html_safe)

        @store.records.each do |record|
          tds = columns.collect do |column|
            content_tag(:td, td_content(record, column)) unless column.hidden?
          end

          tds << td_action(record) if actionable?
          concat content_tag :tr, tds.join.html_safe
        end
      end
    end

    def td_content record, column
      content = record.send(column.data_index)
      content = content.strftime(column.date_format)             unless column.date_format.nil?
      content = link_to content, inject_url(column.link, record) unless column.link.nil?
      content
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end
