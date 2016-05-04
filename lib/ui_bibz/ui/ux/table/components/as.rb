module UiBibz::Ui::Ux

  # As
  #
  class As

    def initialize col, record, content
      @col     = col
      @record  = record
      @content = content
    end

    def render
      case @col.as
      when :boolean
        boolean_render
      end
    end

    private

    def boolean_render
      if @content == true
        glyph = UiBibz::Ui::Core::Glyph.new('check-circle', state: :success)
      else
        glyph = UiBibz::Ui::Core::Glyph.new('minus-circle', state: :danger)
      end
      glyph.render
    end

  end
end
