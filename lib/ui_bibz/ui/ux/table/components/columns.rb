module UiBibz::Ui::Ux
  class Columns

    def initialize columns = nil
      @columns = columns || []
    end

    def column name = nil, options = nil, html_options = nil, &block
      @columns << Column.new(name, options, html_options, &block)
    end

    def list
      @columns
    end
  end
end
