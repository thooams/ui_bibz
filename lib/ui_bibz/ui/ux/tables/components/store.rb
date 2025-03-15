# frozen_string_literal: true

require 'ui_bibz/ui/ux/tables/components/columns'
require 'ui_bibz/ui/ux/tables/components/column'
module UiBibz::Ui::Ux::Tables
  class Store
    attr_accessor :records
    attr_reader :model

    # Store Use WillPaginate store methods
    def initialize(store)
      raise 'Store is nil!' if store.nil?
      raise 'Store can be created only with "table_search_pagination" method!' if store.try(:records).nil?

      @records = store.records
      @store   = store
      @model   = store.model
    end

    delegate :total_pages, :per_page, :total_entries, :current_page, :limit_value, to: :@records
    delegate :id, :sort, :column_id, :direction, :searchable_attributes,
             :search, :controller, :actions_controller, :action, :param_id, :id_key, to: :@store

    def columns
      @columns ||= Columns.new(model.attribute_names.map do |attribute_name|
        Column.new(attribute_name, { name: attribute_name.humanize })
      end)
    end

    def params
      @store.params || {}
    end

    def parameters
      @store.params.to_h
    end
  end
end
