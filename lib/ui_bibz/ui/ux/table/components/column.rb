module UiBibz::Ui::Ux
  class Column < UiBibz::Ui::Core::Component

    attr_accessor :hidden, :link, :name, :data_index, :date_format, :sort, :format, :date_format, :count, :custom_sort, :parent

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @data_index  = @content
      @name        = @options[:name]
      @link        = @options[:link] # for show or edit action
      @order       = @options[:order]
      @date_format = @options[:date_format]
      @sort        = @options[:sort]
      @custom_sort = @options[:custom_sort]
      @parent      = @options[:parent]
      @count       = @options[:count]
      @format      = @options[:format]
      @hidden      = @options[:hidden]
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
