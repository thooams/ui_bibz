module UiBibz::Ui
  class Columns

    def initialize columns = nil
      @columns = []
      @columns = columns unless columns.nil?
    end

    def column hash
      @columns << Column.new(hash)
    end

    def list
      @columns
    end
  end
end
