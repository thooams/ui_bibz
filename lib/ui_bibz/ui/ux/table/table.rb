require "ui_bibz/ui/ux/table/components/store"
require "ui_bibz/ui/ux/table/components/columns"
require "ui_bibz/ui/ux/table/components/column"
require "ui_bibz/ui/ux/table/components/actions"
require "ui_bibz/ui/ux/table/extensions/paginable"
require "ui_bibz/ui/ux/table/extensions/paginable"
require "ui_bibz/ui/ux/table/extensions/searchable"
require "ui_bibz/ui/ux/table/extensions/sortable"
require "ui_bibz/ui/ux/table/extensions/actionable"
module UiBibz::Ui::Ux

  # Create a Table
  #
  # This element is an extend of UiBibz::Ui::Ux::Component.
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
  #   UiBibz::Ui::Ux::Table.new(store: @store)
  #
  #   UiBibz::Ui::Ux::Table.new(store: @store, tap: true) do |t|
  #     t.columns do |c|
  #       c.column name: '#', data_index: '#'
  #     end
  #     t.action do |a|
  #       a.action '', url: url, glyph: ''
  #     end
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Ux::Table.new(store: @users).render
  #
  #   UiBibz::Ui::Ux::Table.new(store: @users).tap do |t|
  #     t.columns do |c|
  #       c.column name: '#', data_index: 'id'
  #       c.column name: 'Name fr', data_index: 'name_fr', link: edit_user_path(:id), order: 2
  #       c.column name: 'Name en', data_index: 'name_en', order: 1
  #       c.column name: 'Name en', data_index: 'name_en', format: lambda{ |records, record| "name #{ record.id}"}
  #     end
  #     t.action do |a|
  #       a.action 'toto', url: users_path(:id), glyph: 'eye'
  #       a.action '---'
  #       a.action 'momo', url: users_path(:id), glyph: 'home'
  #     end
  #   end.render
  #
  class Table < UiBibz::Ui::Core::Component

    attr_accessor :columns

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @columns = Columns.new
      @actions = Actions.new store
    end

    def columns &block
      @columns.tap(&block)
    end

    def actions &block
      @actions.tap(&block)
    end

    def render
      table_html
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

  protected

    def sort
      @sort ||= Sortable.new store, @options
    end

    def action
      @action ||= Actionable.new store, @options, @actions
    end

    def cols
      @columns.list.empty? ? store.columns.list : @columns.list
    end

    def type
      "table-#{ @options[:type] }" unless @options[:type].nil?
    end

    def table_html
      content_tag(:table, class_and_html_options(["table", type])) do

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
