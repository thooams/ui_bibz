module UiBibz::Ui::Ux::Tables
  class Columns

    def initialize columns = nil
      @columns = columns || []
    end

    # Add column in table
    def column data_index = nil, options = nil, html_options = nil, &block
      @columns << Column.new(data_index, options, html_options, &block)
    end

    # Get all columns
    def list
      @columns
    end
  end
end
