require 'will_paginate'
require "will_paginate-bootstrap"
module UiBibz::Ui
  class Grid < Panel
    include WillPaginate::ActionView
    include ActionView
    include Rails.application.routes.url_helpers

    attr_accessor :columns

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = (html_options || {}).merge({ class: 'grid' })
      @columns      = Columns.new
      initialize_store
      initialize_pagination
    end

    def columns &block
      @columns.tap(&block)
    end

    def pagination args
      @pagination = will_paginate(@store.records, args) if @options[:pagination]
    end

    # Add :id in url to match with current record
    def actions &block
      context = eval("self", block.binding)
      @actions = context.capture(&block)
    end

  private

    def actionable?
      @options[:actionable]
    end

    def initialize_store
      if @options[:store].nil?
        raise 'Store is nil!'
      else
        @store = Store.new @options[:store]
      end
    end

    def initialize_pagination
      unless @store.nil?
        # Add controller to fix error: ArgumentError: arguments passed to url_for can't be handled.
        pagination_html = will_paginate(@store.records, params: { controller: @store.controller },  renderer: BootstrapPagination::Rails)
        @footer         = Component.new(pagination_html) if @options[:pagination]
      end
    end

    def default_actions record
      capture do
        concat link_to 'Show', { controller: @store.controller, action: 'show', id: record.id }, role: "menuitem",  tabindex: "-1"
        concat link_to 'Edit', { controller: @store.controller, action: 'edit', id: record.id }, role: "menuitem",  tabindex: "-1"
        concat link_to 'Delete', { controller: @stor.controller, id: record.id }, method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
      end
    end

    def custom_actions record
      @actions.split("\n").compact.map{ |l| inject_url(l, record) }.join().html_safe unless @actions.nil?
    end

    def inject_url url, record
      url.gsub('/id"', "/#{ record.id }\"")
    end

    def dropdown_action record
      # TODO: Fix links without eval

      Dropdown.new 'Action', { position: :right }, class: 'btn-group-xs' do |d|
        actions = custom_actions(record) || default_actions(record)
        content_tag :li, actions, role: 'presentation'
      end.render
    end

    def table_html
      content_tag :table, class: 'table table-hover' do
        columns = @columns.list.empty? ? @store.columns.list : @columns.list

        ths = columns.collect do |column|
          content_tag(:th, column.name) unless column.hidden?
        end

        ths << content_tag(:th, 'Action') if actionable?
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
