module UiBibz::Concerns::Models::Searchable
  extend ActiveSupport::Concern

  included do

    def self.grid_search_pagination params
      OpenStruct.new(records: search_sort_paginate(params),
                     controller: params[:controller],
                     direction:  params[:direction],
                     search:     params[:search],
                     sort:       params[:sort],
                     action:     params[:action])
    end


  private

    def self.search query
      unless query.blank?
        sql            = []
        sql_attributes = {}

        @searchable_attributes.each do |attribute|
          sql << "lower(#{ self.to_s.downcase.pluralize }.#{ attribute }) LIKE :#{ attribute }"
          sql_attributes = sql_attributes.merge(Hash[attribute, "'%#{ query.downcase }%'"])
        end

        where(sql.join(' OR '), sql_attributes)
      else
        all
      end
    end

    def self.model
      self.to_s.downcase.pluralize
    end

    def self.order_sql(params)
      params[:sort].nil? || params[:direction].nil? ? "#{ model }.id asc" : "#{ params[:sort]} #{ params[:direction] }"
    end

    def self.search_sort_paginate params
      self.search(params[:search]).reorder(order_sql(params)).paginate(:page => params[:page], per_page: params[:per_page])
    end
  end

  module ClassMethods
    def searchable_attributes *args
      @searchable_attributes ||= args
    end
  end

end
