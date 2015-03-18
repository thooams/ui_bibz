module UiBibz::Concerns::Models::Searchable
  extend ActiveSupport::Concern

  included do

    def self.grid_search_pagination params, session
      OpenStruct.new(records: search_sort_paginate(params, session),
                     controller: params[:controller],
                     direction:  params[:direction],
                     search:     params[:search],
                     sort:       params[:sort],
                     searchable_attributes: @searchable_attributes,
                     action:     params[:action])
    end


  private

    def self.search query
      unless query.blank?
        sql            = []
        sql_attributes = {}

        @searchable_attributes.each do |attribute|
          sql << "lower(#{ self.to_s.downcase.pluralize }.#{ attribute }) LIKE :#{ attribute }"
          sql_attributes = sql_attributes.merge(Hash[attribute, "%#{ query.downcase }%"])
        end

        where(sql.join(' OR '), sql_attributes)
      else
        all
      end
    end

    def self.order_sql(params)
      params[:sort].nil? || params[:direction].nil? ? "#{ self.table_name }.id asc" : "#{ params[:sort]} #{ params[:direction] }"
    end

    def self.search_sort_paginate params, session
      session[:per_page] = params[:per_page] unless params[:per_page].nil?
      #self.search(params[:search]).reorder(order_sql(params)).paginate(:page => params[:page], per_page: session[:per_page])
      select(" * FROM (#{ table_name }, count(*) FROM #{table_name} WHERE #{ self.search(params[:search]).to_sql } GROUP BY #{table_name}.id AS countable)").order("countable.count").paginate(:page => params[:page], per_page: session[:per_page])
      #SELECT * FROM (
      #  SELECT documents.*, count(*)
      #FROM downcasecuments
      #WHERE (lower(documents.name_fr) ILIKE '%toto%'
      #               OR lower(documents.name_en) ILIKE '%toto%'
      #               OR lower(documents.code_fr) ILIKE '%to_sto%'
      #               OR lower(documents.code_en) ILIKE '%toto%')
      #group by documents.moduleid) tab1
      #ORDER BY tab1.count
    end
  end

  module ClassMethods
    def searchable_attributes *args
      @searchable_attributes ||= args
    end
  end

end
