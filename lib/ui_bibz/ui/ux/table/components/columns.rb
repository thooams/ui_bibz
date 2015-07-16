module UiBibz::Ui::Ux
  class Columns

    def initialize columns = nil
      @columns = columns || []
    end

    # Add column in table
    def column name = nil, options = nil, html_options = nil, &block
      @columns << Column.new(name, options, html_options, &block)
    end

    # Get all columns
    def list
      @columns
    end
  end
end
