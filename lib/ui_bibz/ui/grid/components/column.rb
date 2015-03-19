module UiBibz::Ui
  class Column

    attr_accessor :hidden, :link, :name, :data_index, :date_format, :sort, :format, :date_format, :count, :custom_sort

    def initialize args
      @args        = args
      @link        = args[:link] # show or edit
      @name        = args[:name]
      @order       = args[:order]
      @data_index  = args[:data_index]
      @date_format = args[:date_format]
      @sort        = args[:sort]
      @custom_sort = args[:custom_sort]
      @count       = args[:count]
      @format      = args[:format]
      @hidden      = args[:hidden]
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
