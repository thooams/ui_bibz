module UiBibz::Ui::Ux
  class Columns

    def initialize columns = nil
      @columns = columns || []
    end

    def column hash
      @columns << Column.new(hash)
    end

    def list
      @columns
    end
  end
end
