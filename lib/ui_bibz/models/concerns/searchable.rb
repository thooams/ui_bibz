module UiBibz
  module Searchable
    extend ActiveSupport::Concern

    included do

      def self.search query
        if query
          sql = []
          @searchable_attributes.each do |attribute|
            sql << "#{ attribute } ILIKE '%#{ query }%'"
          end
          where(sql.join(' OR '))
        else
          all
        end
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
