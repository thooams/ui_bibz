module UiBibz::Ui::Ux

  # Create a TableCard
  #
  # This element is an extend of UiBibz::Ui::Ux::card.
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
  #   UiBibz::Ui::Ux::TableCard.new(store: @store)
  #
  #   UiBibz::Ui::Ux::TableCard.new(store: @store, tap: true) do |t|
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
  #   UiBibz::Ui::Ux::TableCard.new(store: @users, table_options: { actionable: false }).render
  #
  #   UiBibz::Ui::Ux::TableCard.new(store: @users).tap do |t|
  #     t.header 'My Table card'
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
  #   table_card(options = {}, html_options = {})
  #
  #   table_card(options = { tap: true }, html_options = {}) do |t|
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
  class TableCard < UiBibz::Ui::Core::Card

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
      init_components

      content_tag :div, class_and_html_options("card table-card") do
        form_tag(url_for(url_parameters), method: :get) do
          @items.join.html_safe
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

    def init_components
      @items << search.render     if search.searchable?
      @items << table.render      unless @store.nil?
      @items << pagination.render if pagination.paginable?
    end

    def url_parameters
      { controller: @store.controller, action: @store.action, id: @store.param_id }
    end

    def table
      @table
    end

    def search
      @search ||= Searchable.new @store, @options, { class: 'card-header' }
    end

    def pagination
      @pagination ||= Paginable.new @store, @options, { class: 'card-footer' }
    end

  end
end
