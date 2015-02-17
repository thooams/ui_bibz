module UiBibz
  module Searchable
    extend ActiveSupport::Concern

    included do

      def self.grid params
        OpenStruct.new(records: self.search(params[:search])
                                    .reorder(order_sql(params))
                                    .paginate(:page => params[:page], per_page: params[:per_page]),
                       controller: params[:controller],
                       direction:  params[:direction],
                       search:     params[:search],
                       sort:       params[:sort],
                       action:     params[:action])
      end

      def self.search query
        unless query.blank?
          sql = []
          @searchable_attributes.each do |attribute|
            sql << "#{ self.to_s.downcase.pluralize }.#{ attribute } ILIKE ?"
          end
          # This is evil !!
          eval("where(sql.join(' OR '), #{ sql.map{ "'%#{ query }%'" }.join(', ')})")
        else
          all
        end
      end

      def self.order_sql(params)
        params[:sort].nil? || params[:direction].nil? ? "#{ model }.id asc" : "#{ params[:sort]} #{ params[:direction] }"
      end

      def self.model
        self.to_s.downcase.pluralize
      end
    end

    module ClassMethods
      def searchable_attributes *args
        @searchable_attributes ||= args
      end
    end

  end
end
ActiveRecord::Base.send :include, UiBibz::Searchable
