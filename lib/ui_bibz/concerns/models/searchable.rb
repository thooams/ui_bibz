# frozen_string_literal: true

module UiBibz::Concerns::Models::Searchable
  extend ActiveSupport::Concern

  included do
    # Maybe create a class to put all methods of table_search_pagination
    def self.table_search_pagination(params, session, args = {})
      @params           = params.permit!
      @session          = session
      @arguments        = args

      initialize_params
      OpenStruct.new(generate_parameters)
    end

    def self.generate_parameters
      {
        controller: @arguments[:controller] || @params[:controller],
        param_id: @params[:id],
        params: @params,
        direction: @params[:direction],
        search: @params[:search],
        sort: @params[:sort],
        action: @params[:action],
        column_id: @params[:column_id],
        id: @arguments[:store_id],
        records: search_sort_paginate,
        searchable_attributes: @searchable_attributes,
        model: create_model
      }
    end

    def self.create_model
      @arguments[:model].nil? ? self : @arguments[:model].to_s.camelize.classify.constantize
    end

    # If there is more one table in html page
    def self.initialize_params
      @tmp_params = { per_page: @arguments[:per_page] }

      return unless good_store_id?

      @tmp_params = {
        search: @params[:search],
        per_page: @params[:per_page] || @arguments[:per_page],
        page: new_search? ? nil : @params[:page],
        sort: @params[:sort],
        direction: @params[:direction]
      }
    end

    def self.search
      sql         = all
      column_args = fetch_column_args

      # Add joins
      sql = joins(column_args[:joins]) if column_args[:joins]

      # Append special argument for sort countable
      sql = generate_select_count_sort_query sql, column_args if column_args[:count]

      # Manage parent sort in the same model
      sql = generate_parent_sort_query sql if @params[:parent]

      # Main query with argument or not
      sql = search_by_query sql if @tmp_params[:search].present?

      generate_sql sql, column_args
    end

    def self.generate_sql(sql, column_args)
      column_args[:count].nil? ? generate_default_sql(sql) : generate_count_sql(sql)
    end

    def self.generate_default_sql(sql)
      if sorting?
        sql.paginate(page: @tmp_params[:page], per_page: @session[:per_page])
      else
        sql.reorder(order_sql).paginate(page: @tmp_params[:page], per_page: @session[:per_page])
      end
    end

    def self.generate_count_sql(sql)
      sq = "SELECT * FROM (#{sql.group("#{table_name}.id").to_sql}) countable ORDER BY countable.count #{@tmp_params[:direction] || asc}"
      paginate_by_sql(sq, page: @tmp_params[:page], per_page: @session[:per_page])
    end

    def self.generate_select_count_sort_query(sql, column_args)
      sql.select("#{table_name}.*, count(#{column_args[:column]}.*)")
    end

    def self.generate_parent_sort_query(sql)
      sql.select("#{table_name}2.*, #{@tmp_params[:sort]} AS parent_name").from("#{table_name} #{table_name}2").joins("LEFT OUTER JOIN #{table_name} ON #{table_name}2.parent_id = #{table_name}.id")
    end

    def self.fetch_column_args
      column_args = {}
      column_args = [@arguments[:sortable]].flatten.detect { |f| f[:column] = @params[:column_name] } || {} if !@arguments[:sortable].nil? && @params[:custom_sort]
      column_args
    end

    def self.sorting?
      @tmp_params[:sort].nil? || @tmp_params[:direction].nil?
    end

    def self.search_by_query(sql)
      raise 'Add searchable_attributes method in Model' if @searchable_attributes.nil?

      sql_query       = []
      sql_attributes  = {}
      search_patterns = @tmp_params[:search].strip.gsub(/(?<=[\\s])\\s*|^\\s+|\\s+$/, '').downcase

      search_patterns_tmp = search_patterns.scan(/"(.*?)"/).flatten
      search_patterns     = search_patterns.gsub(/"(.*?)"/, '').split
      search_patterns << search_patterns_tmp

      search_patterns.flatten.each_with_index do |pattern, i|
        sql_subquery = []
        @searchable_attributes.each do |attribute|
          if attribute.is_a?(Hash)
            if attribute == :as
              attribute.each_value do |value|
                sql_subquery << "lower(CAST(#{value} AS TEXT)) LIKE :#{value}_#{i}"
                sql_attributes = sql_attributes.merge({ "#{value}_#{i}".to_sym => "%#{pattern}%" })
              end
            else
              key_name = attribute.keys.first.to_s.pluralize
              attribute.each_value do |value|
                sql_subquery << "lower(CAST(#{key_name}.#{value} AS TEXT)) LIKE :#{key_name}_#{value}_#{i}"
                sql_attributes = sql_attributes.merge({ "#{key_name}_#{value}_#{i}".to_sym => "%#{pattern}%" })
              end
            end
          else
            sql_subquery << "lower(CAST(#{to_s.underscore.pluralize.split('/').last}.#{attribute} AS TEXT)) LIKE :#{attribute}_#{i}"
            sql_attributes = sql_attributes.merge({ "#{attribute}_#{i}".to_sym => "%#{pattern}%" })
          end
        end
        sql_query << "(#{sql_subquery.join(' OR ')})"
      end

      sql.where([sql_query.join(' AND '), sql_attributes])
    end

    def self.order_sql
      sorting? ? "#{table_name}.id asc" : "#{@tmp_params[:sort]} #{@tmp_params[:direction]}"
    end

    def self.search_sort_paginate
      @session[:per_page] = @tmp_params[:per_page] unless @tmp_params[:per_page].nil?
      search
    end

    # If there's several table in the same page
    def self.good_store_id?
      @arguments[:store_id] == @params[:store_id]
    end

    def self.new_search?
      @params[:link_type] == 'search'
    end
  end

  module ClassMethods
    # => searchable_attributes :name, :address
    # or
    # => searchable_attributes user: :name
    # or
    # => searchable_attributes user: [:name, :address]
    # or
    # => search_attributes :name, as: [:mybuildcolumn1, :mybuild_column2]
    #
    def searchable_attributes(*args)
      @searchable_attributes ||= args
    end
  end
end
