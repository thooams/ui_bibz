module UiBibz::Concerns::Models::Searchable
  extend ActiveSupport::Concern

  included do
    # Maybe create a class to put all methods of table_search_pagination
    def self.table_search_pagination params, session, args = {}
      @params           = params.clone
      @session          = session
      @arguments        = args

      initialize_params unless @arguments[:store_id].nil?
      OpenStruct.new(generate_parameters)
    end

  private

    def self.generate_parameters
      {
        controller:            @params[:controller],
        param_id:              @params[:id],
        params:                @params,
        direction:             @params[:direction],
        search:                @params[:search],
        sort:                  @params[:sort],
        action:                @params[:action],
        column_id:             @params[:column_id],
        id:                    @arguments[:store_id],
        records:               search_sort_paginate,
        searchable_attributes: @searchable_attributes,
        model:                 self
      }
    end

    # If there is more one table in html page
    def self.initialize_params
      unless self.is_good_store_id?
        @params[:search]    = nil
        @params[:per_page]  = nil
        @params[:page]      = nil
        @params[:sort]      = nil
        @params[:direction] = nil
      end
    end

    def self.search
      sql         = all
      column_args = get_column_args

      # Add joins
      sql = joins(column_args[:joins]) if column_args[:joins]

      # Append special argument for sort countable
      sql = generate_select_count_sort_query sql, column_args if column_args[:count]

      # Manage parent sort in the same model
      sql = generate_parent_sort_query sql if @params[:parent]

      # Main query with argument or not
      sql = search_by_query sql unless @params[:search].blank?

      generate_sql sql, column_args
    end

    def self.generate_sql sql, column_args
      column_args[:count].nil? ? generate_default_sql(sql) : generate_count_sql(sql)
    end

    def self.generate_default_sql sql
      if is_sorting?
        sql.paginate(:page => @params[:page], per_page: @session[:per_page])
      else
        sql.reorder(order_sql).paginate(:page => @params[:page], per_page: @session[:per_page])
      end
    end

    def self.generate_count_sql sql
      sq = "SELECT * FROM (#{ sql.group(table_name + '.id').to_sql }) countable ORDER BY countable.count #{ @params[:direction] || asc }"
      self.paginate_by_sql(sq, :page => @params[:page], per_page: @session[:per_page])
    end

    def self.generate_select_count_sort_query sql, column_args
      sql.select("#{ table_name }.*, count(#{ column_args[:column] }.*)")
    end

    def self.generate_parent_sort_query sql
      sql.select("#{ table_name }2.*, #{ @params[:sort] } AS parent_name").from("#{ table_name } #{ table_name }2").joins("LEFT OUTER JOIN #{ table_name } ON #{ table_name }2.parent_id = #{ table_name }.id")
    end

    def self.get_column_args
      column_args = {}
      if !@arguments[:sortable].nil? && @params[:custom_sort]
        column_args = [@arguments[:sortable]].flatten.detect{|f| f[:column] = @params[:column_name] } || {}
      end
      column_args
    end

    def self.is_sorting?
      @params[:sort].nil? || @params[:direction].nil?
    end

    def self.search_by_query sql
      sql_query      = []
      sql_attributes = {}

      @searchable_attributes.each do |attribute|
        if attribute.kind_of?(Hash)
          sql_query << "lower(#{ attribute.keys.first.to_s.pluralize }.#{ attribute.values.first }) LIKE :#{ attribute.values.first }"
          sql_attributes = sql_attributes.merge(Hash[attribute.values.first, "%#{ @params[:search].downcase }%"])
        else
          sql_query << "lower(#{ self.to_s.underscore.pluralize }.#{ attribute }) LIKE :#{ attribute }"
          sql_attributes = sql_attributes.merge(Hash[attribute, "%#{ @params[:search].downcase }%"])
        end
      end

      sql.where([sql_query.join(' OR '), sql_attributes])
    end

    def self.order_sql
      self.is_sorting? ? "#{ self.table_name }.id asc" : "#{ @params[:sort]} #{ @params[:direction] }"
    end

    def self.search_sort_paginate
      @session[:per_page] = @params[:per_page] unless @params[:per_page].nil?
      self.search
    end

    # If there's several table in the same page
    def self.is_good_store_id?
      @arguments[:store_id] == @params[:store_id]
    end
  end

  module ClassMethods
    def searchable_attributes *args
      @searchable_attributes ||= args
    end
  end

end
