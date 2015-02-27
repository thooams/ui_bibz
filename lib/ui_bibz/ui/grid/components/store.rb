module UiBibz::Ui
  class Store

    attr_accessor :records

    def initialize store
      @records = store.records
      @store   = store
    end

    def total_pages
      @records.total_pages
    end

    def per_page
      @records.per_page
    end

    def sort
      @store.sort
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
      @columns ||= Columns.new @records.new.attributes.keys.map{ |record| Column.new({ data_index: record, name: record.humanize }) }
    end

    def model
      @model ||= @records.new.class
    end

    def search
      @store.search
    end

    def controller
      @store.controller
    end

    def action
      @store.action
    end

  end
end
