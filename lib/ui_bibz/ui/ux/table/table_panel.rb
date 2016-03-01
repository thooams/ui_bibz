require "ui_bibz/ui/ux/table/components/store"
module UiBibz::Ui::Ux

  # Create a TablePanel
  #
  # This element is an extend of UiBibz::Ui::Ux::Panel.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +store+ - Store generate by '+table_search_pagination+' method
  # * +url+ - String
  # * +tap+ - Boolean
  # * +table_options+ - Hash
  #   * +actionable+ - Boolean
  #   * +sortable+ - Boolean
  #   * +searchable+ - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::TablePanel.new(store: @store)
  #
  #   UiBibz::Ui::Ux::TablePanel.new(store: @store, tap: true) do |t|
  #     t.columns do |c|
  #       c.column '#', { data_index: '#' }
  #     end
  #     t.actions do |a|
  #       a.action '', url: url, glyph: ''
  #     end
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Ux::TablePanel.new(store: @users, table_options: { actionable: false }).render
  #
  #   UiBibz::Ui::Ux::TablePanel.new(store: @users).tap do |t|
  #     t.header 'My Table panel'
  #     t.columns do |c|
  #       c.column :id, { name: '# }, { class: 'column-id' }
  #       c.column :name_fr, { name: 'Name FR', link: edit_user_path(:id), order: 2 }
  #       c.column :name_en
  #       c.column :status_id, { name: 'Status', format: lambda{ |records, record| "Test #{ record.id}"} }
  #     end
  #     t.actions do |a|
  #       a.action 'toto', url: users_path(:id), glyph: 'eye'
  #       a.action '---'
  #       a.action 'momo', url: users_path(:id), glyph: 'home'
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   table_panel(options = {}, html_options = {})
  #
  #   table_panel(options = { tap: true }, html_options = {}) do |t|
  #     t.header(content, options = {}, html_options = {})
  #     # or
  #     t.header(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     t.body(content, options = {}, html_options = {})
  #     # or
  #     t.body(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     t.columns do |cls|
  #       cls.column(name, options = {}, html_options = {})
  #       cls.column(options = {}, html_options = {}) do
  #         name
  #       end
  #     end
  #     t.actions do |acs|
  #       acs.action(name, options = {}, html_options = {})
  #       acs.action(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #
  #     t.footer(content, options = {}, html_options = {})
  #     # or
  #     t.footer(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  class TablePanel < UiBibz::Ui::Core::Panel

    attr_accessor :columns

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      table_options = (@options[:table_options] || {}).merge({ store: store })
      @table        = UiBibz::Ui::Ux::Table.new(table_options, @options[:table_html_options])
    end

    # Render html tag
    def render
      initialize_header
      initialize_footer

      content_tag :div, class_and_html_options(panel_classes) do |f|
        form_tag(url_for(url_parameters), method: :get) do
          store.parameters.each do |k,v|
            concat tag(:input, type: 'hidden', name: k, value: v) if !default_parameters?(k) && !v.blank?
          end
          concat tag(:input, type: 'hidden', name: 'store_id', value: store.id) unless store.id.nil? # if there is more one table in html page
          concat(header_html) unless @header.nil?
          concat(body_html)   unless @body.nil?
          concat(table_html)  unless store.nil?
          concat(footer_html) unless @footer.nil?
        end
      end
    end

    # Add table columns item
    def columns &block
      @table.columns &block
    end

    # Add table actions item
    def actions &block
      @table.actions &block
    end

    # for test
    def actions_list
      @table.actions_list
    end

  private

    def store
      @store ||= if @options[:store].nil?
        raise 'Store is nil!'
      elsif @options[:store].try(:records).nil?
        raise 'Store can be created only with "table_search_pagination" method!'
      else
        Store.new @options.delete(:store) if @options[:store]
      end
    end

    def default_parameters?(k)
      %w(store_id per_page search utf8 search controller action utf8).include?(k)
    end

    def url_parameters
      { controller: store.controller, action: store.action, id: store.param_id }
    end

    def table_html
      content_tag :div, @table.render, class: 'panel-table'
    end

    def panel_classes
      %w(panel panel-default table-panel)
    end

    def search
      @search ||= Searchable.new store, @options.merge({ wrap_form: false })
    end

    def pagination
      @pagination ||= Paginable.new store, @options.merge({ wrap_form: false })
    end

    def initialize_footer
      @footer = @table.pagination
    end

    def initialize_header
      @header = UiBibz::Ui::Core::Component.new search.render
    end

    def initialize_footer
      @footer = UiBibz::Ui::Core::Component.new(pagination.render) if pagination.paginable?
    end

  end
end