# frozen_string_literal: true

module UiBibz::Ui::Ux::Tables
  class Column < UiBibz::Ui::Core::Component
    attr_accessor :hidden, :link, :name, :input_options, :class, :as, :data_index,
                  :date_format, :sort, :format, :count, :custom_sort, :parent, :id, :progress_options,
                  :sortable, :association_attribute

    def initialize(content = nil, options = nil, html_options = nil, &)
      super
      @data_index    = @content
      @id            = @options[:column_id] || @data_index
      @name          = @options[:name]
      @link          = @options[:link] # for show or edit action
      @order         = @options[:order]
      @date_format   = @options[:date_format]
      @sort          = @options[:sort]
      @custom_sort   = @options[:custom_sort]
      @parent        = @options[:parent]
      @count         = @options[:count]
      @as            = @options[:as]
      @format        = @options[:format]
      @class         = @options[:class]
      @hidden        = @options[:hidden]
      @sortable      = @options[:sortable]
      @input_options = @options[:input_options]
      @association_attribute = @options[:association_attribute]
      @progress_options = @options[:progress_options] || {}
    end

    def linkable?
      !@link.nil?
    end

    def order
      @order || 0
    end

    def hidden?
      @hidden == true
    end
  end
end
