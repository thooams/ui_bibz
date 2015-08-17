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
  # * tap - Boolean
  # * columns - Add column
  # * actions - Add action by row
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
  #   UiBibz::Ui::Ux::TablePanel.new(store: @users, pagination).render
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
      @store        = @options.delete(:store) if @options[:store]
      table_options = (@options[:table_options] || {}).merge({ store: @store })
      @table        = UiBibz::Ui::Ux::Table.new(table_options, @options[:table_html_options])
    end

    # Render html tag
    def render
      initialize_header
      initialize_footer

      content_tag :div, class_and_html_options(panel_classes) do |f|
        form_tag(url_for(controller: @store.controller, action: @store.action), method: :get) do
          concat(header_html)   unless @header.nil?
          concat(body_html)     unless @body.nil?
          concat(table_html)    unless @store.nil?
          concat(footer_html)   unless @footer.nil?
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

  private

    def table_html
      content_tag :div, @table.render, class: 'panel-table'
    end

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
      @header = UiBibz::Ui::Core::Component.new search.render
    end

    def initialize_footer
      @footer = UiBibz::Ui::Core::Component.new(pagination.render) if pagination.paginable?
    end

  end
end
