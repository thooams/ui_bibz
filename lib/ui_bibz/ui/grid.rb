module UiBibz::Ui
  class Grid < Panel
    #include WillPaginate::ActionView
    include ActionView
    #include Rails.application.routes.url_helpers

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
      @pagination = will_paginate @store.records, args if @options[:pagination]
    end

    # Add :id in url to match with current record
    def actions &block
      context = eval("self", block.binding)
      context.init_haml_helpers
      @actions = context.capture(&block)
    end

    def main_app
  Rails.application.class.routes.url_helpers
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
        options     = { total_pages: @store.total_pages }
        ap 'pagination before'
        #@pagination = Kaminari::Helpers::Paginator.new(@store.records, options.reverse_merge(:current_page => @store.current_page, :per_page => @store.limit_value, :remote => false)).to_s
        ap 'pagination after'
        ap @pagination
        # @footer     = Component.new @pagination if @options[:pagination]
        ap @store.records
        @footer     = Component.new will_paginate(@store.records, :params => {
                                                                        :only_path => true,
                                                                        :use_route => '/',
                                                                        :scope => main_app
                                                                      }) if @options[:pagination]
        ap @footer
      end
    end

    def default_actions record
      url_helpers = Rails.application.routes.url_helpers
      capture do
        concat link_to 'Show', eval("url_helpers.#{ @store.model.downcase }_path(#{ record.id })"), role: "menuitem",  tabindex: "-1"
        concat link_to 'Edit', eval("url_helpers.edit_#{ @store.model.downcase }_path(#{ record.id })"),  role: "menuitem",  tabindex: "-1"
        concat link_to 'Delete', eval("url_helpers.#{ @store.model.downcase }_path(#{ record.id })"), method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
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
        link_to content, eval("url_helpers.edit_#{ @store.model.downcase }_path(#{ record.id })")
      when :show
        link_to content, eval("url_helpers.#{ @store.model.downcase }_path(#{ record.id })")
      else
        content
      end
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end
