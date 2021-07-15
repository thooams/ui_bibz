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

    def total_pages
      @records.total_pages
    end

    def per_page
      @records.per_page
    end

    def total_entries
      @records.total_entries
    end

    def id
      @store.id
    end

    def sort
      @store.sort
    end

    def column_id
      @store.column_id
    end

    def direction
      @store.direction
    end

    def searchable_attributes
      @store.searchable_attributes
    end

    def current_page
      @records.current_page
    end

    def limit_value
      @records.limit_value
    end

    def columns
      @columns ||= Columns.new(model.attribute_names.map { |attribute_name| Column.new(attribute_name, { name: attribute_name.humanize }) })
    end

    attr_reader :model

    def search
      @store.search
    end

    def controller
      @store.controller
    end

    def params
      @store.params || {}
    end

    def parameters
      @store.params.to_h
    end

    def action
      @store.action
    end

    def param_id
      @store.param_id
    end
  end
end
