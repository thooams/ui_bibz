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
      sq =  'documents.*, count(*)'
      unless query.blank?
        sql            = []
        sql_attributes = {}


        @searchable_attributes.each do |attribute|
          sql << "lower(#{ self.to_s.downcase.pluralize }.#{ attribute }) LIKE :#{ attribute }"
          sql_attributes = sql_attributes.merge(Hash[attribute, "%#{ query.downcase }%"])
        end

        first_sql =  "SELECT #{ sq } FROM #{ table_name } WHERE #{ sql.join(' OR ') } GROUP BY #{table_name}.id"

        sanitize_sql_array ["SELECT * FROM (#{ first_sql }) countable ORDER BY countable.count", sql_attributes]
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
      self.paginate_by_sql(self.search(params[:search]), :page => params[:page], per_page: session[:per_page])
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
