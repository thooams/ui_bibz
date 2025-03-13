# frozen_string_literal: true

require 'ui_bibz/ui/ux/tables/components/columns'
require 'ui_bibz/ui/ux/tables/components/column'
module UiBibz::Ui::Ux::Tables
  class Store
    attr_accessor :records

    # Store Use WillPaginate store methods
    def initialize(store)
      raise 'Store is nil!' if store.nil?
      raise 'Store can be created only with "table_search_pagination" method!' if store.try(:records).nil?

      @records = store.records
      @store   = store
      @model   = store.model
    end

    delegate :total_pages, to: :@records

    delegate :per_page, to: :@records

    delegate :total_entries, to: :@records

    delegate :id, to: :@store

    delegate :sort, to: :@store

    delegate :column_id, to: :@store

    delegate :direction, to: :@store

    delegate :searchable_attributes, to: :@store

    delegate :current_page, to: :@records

    delegate :limit_value, to: :@records

    def columns
      @columns ||= Columns.new(model.attribute_names.map { |attribute_name| Column.new(attribute_name, { name: attribute_name.humanize }) })
    end

    attr_reader :model

    delegate :search, to: :@store

    delegate :controller, to: :@store

    delegate :actions_controller, to: :@store

    def params
      @store.params || {}
    end

    def parameters
      @store.params.to_h
    end

    delegate :action, to: :@store

    delegate :param_id, to: :@store

    delegate :id_key, to: :@store
  end
end
