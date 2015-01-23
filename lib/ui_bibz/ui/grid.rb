require 'will_paginate'
require "will_paginate-bootstrap"
module UiBibz::Ui
  class Grid < Panel
    include WillPaginate::ActionView
    include ActionView
    include Rails.application.routes.url_helpers

    def initialize options = nil, html_options = nil
      @options      = options || {}
      @html_options = html_options || {}
      initialize_store
      initialize_pagination
    end

    def columns items = nil
      @columns = items.map{ |item| Column.new item } unless items.nil?
    end

    def pagination args
      @pagination = will_paginate(@store.records, args) if @options[:pagination]
    end

    # Add :id in url to match with current record
    def actions &block
      context = eval("self", block.binding)
      #context.init_haml_helpers
      @actions = context.capture(&block)
    end

  private

    def editable?
      @options[:editable]
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
        concat link_to 'Delete', { controller: @stor.controller, id: record.id}, method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
      end
    end

    def custom_actions record
      unless @actions.nil?
        @actions.split("\n").compact.map{ |l| l.gsub('/id"', "/#{ record.id }\"") }.join().html_safe
      end
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
        columns = @columns.nil? ? @store.columns : @columns

        ths = columns.collect do |column|
          content_tag(:th, column.name) unless column.hidden?
        end

        ths << content_tag(:th, 'Action') if editable?
        concat content_tag(:tr, ths.join.html_safe)

        @store.records.each do |record|
          tds = columns.collect do |column|
            content_tag(:td, td_content(record, column)) unless column.hidden?
          end

          tds << td_action(record) if editable?
          concat content_tag :tr, tds.join.html_safe
        end
      end
    end

    def td_content record, column
      content = record[column.data_index.to_sym]
      content = content.strftime(column.date_format) unless column.date_format.nil?

      case column.link
      when :edit
        link_to content, { controller: @store.controller, action: 'edit', id: record.id }
      when :show
        link_to content, { controller: @store.controller, action: 'show', id: record.id }
      else
        content
      end
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end
