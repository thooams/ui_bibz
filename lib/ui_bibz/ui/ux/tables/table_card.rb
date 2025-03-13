# frozen_string_literal: true

require 'ui_bibz/ui/ux/tables/components/store'
module UiBibz::Ui::Ux::Tables
  # Create a TableCard
  #
  # This element is an extend of UiBibz::Ui::Core::Boxes::card.
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
  # * +table_options+ - Hash
  #   * +actionable+ - Boolean
  #   * +sortable+ - Boolean
  #   * +searchable+ - Boolean
  #   * +status+
  #     (+:inverse+)
  #   * +thead+ - Hash
  #     (+status+)
  #       (+inverse+, +default+)
  #   * +bordered+ - Boolean
  #   * +hoverable+ - Boolean
  #   * +size+
  #     (+sm+)
  #   * +responsive+ - Boolean
  #   * +breakpoint+
  #     (+:sm+, +:md+, +:lg+, +:xl+, +:xxl+)
  #
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Tables::TableCard.new(store: @store)
  #
  #   UiBibz::Ui::Ux::Tables::TableCard.new(store: @store) do |t|
  #     t.columns do |c|
  #       c.column '#', { data_index: '#' }
  #     end
  #     t.actions do |a|
  #       a.link '', url: url, glyph: ''
  #     end
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Ux::Tables::TableCard.new(store: @users, table_options: { actionable: false }).render
  #
  #   UiBibz::Ui::Ux::Tables::TableCard.new(store: @users).tap do |t|
  #     t.header 'My Table card'
  #     t.columns do |c|
  #       c.column :id, { name: '# }, { class: 'column-id' }
  #       c.column :name_fr, { name: 'Name FR', link: edit_user_path(:id), order: 2 }
  #       c.column :name_en
  #       c.column :state_id, { name: 'state', format: lambda{ |records, record| "Test #{ record.id}"} }
  #     end
  #     t.actions do |a|
  #       a.link 'state', url: users_path(:id), glyph: 'eye'
  #       a.divider
  #       a.link 'momo', url: users_path(:id), glyph: 'home'
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   table_card(options = {}, html_options = {})
  #
  #   table_card(options = {}, html_options = {}) do |t|
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
  class TableCard < UiBibz::Ui::Core::Boxes::Card
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Boxes::Card.initialize
    def initialize(...)
      super
      table_options = (@options[:table_options] || {}).merge({ store: })
      @table        = UiBibz::Ui::Ux::Tables::Table.new(table_options, @options[:table_html_options])
    end

    # Render html tag
    def pre_render
      init_components

      content_tag :div, html_options do
        form_tag(url_for(url_parameters), method: :get) do
          store.parameters.with_indifferent_access.reject { |k, v| default_parameters?(k) || v.blank? }.each do |k, v|
            concat tag(:input, type: 'hidden', name: k, value: v)
          end
          concat tag(:input, type: 'hidden', name: 'store_id', value: store.id) unless store.id.nil? # if there is more one table in html page
          concat @items.join.html_safe
        end
      end
    end

    # Add table columns item
    def columns(&)
      @table.columns(&)
    end

    # Add table actions item
    def actions(&)
      @table.actions(&)
    end

    # for test
    delegate :actions_list, to: :@table

    private

    def component_html_classes
      %w[card table-card]
    end

    def store
      raise 'Store is nil!' if @options[:store].nil?
      raise 'Store can be created only with "table_search_pagination" method!' if @options[:store].try(:records).nil?

      @store ||= Store.new @options[:store]
    end

    def init_components
      @items << search.render     if search.searchable?
      @items << table.render      unless @store.nil?
      @items << pagination.render if pagination.paginable?
    end

    def default_parameters?(key)
      %w[store_id per_page page search utf8 search controller action link_type].include?(key)
    end

    def url_parameters
      { controller: store.controller, action: store.action, id: store.param_id }
    end

    attr_reader :table

    def table_html
      content_tag :div, @table.render, class: 'card-table'
    end

    def search
      @search ||= Searchable.new store, @options.merge({ wrap_form: false }), { class: 'card-header' }
    end

    def pagination
      @pagination ||= Paginable.new store, @options.merge({ wrap_form: false }), { class: 'card-footer' }
    end
  end
end
