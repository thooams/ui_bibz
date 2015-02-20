module UiBibz::Ui
  class Column

    attr_accessor :hidden, :link, :name, :data_index, :date_format, :sort

    def initialize args
      @args       = args
      @link       = args[:link] # show or edit
      @name       = args[:name]
      @order      = args[:order]
      @data_index = args[:data_index]
      @sort       = args[:sort]
      @hidden     = args[:hidden]
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
