module UiBibz::Ui::Ux::Tables

  # As
  #
  class As

    def initialize col, record, content, table_options
      @col     = col
      @record  = record
      @content = content
      @form    = table_options.try(:[], :form)
    end

    def render
      case @col.as
      when :boolean
        boolean_render
      when :progress
        progress_render
      when :input
        inp_options = (@col.input_options || {}).merge({ label: false })
        @form.input @col.data_index, inp_options
      end
    end

    private

    def boolean_render
      if @content == true
        glyph = UiBibz::Ui::Core::Glyph.new('check-circle', status: :success)
      else
        glyph = UiBibz::Ui::Core::Glyph.new('minus-circle', status: :danger)
      end
      glyph.render
    end

    def progress_render
      UiBibz::Ui::Core::Progress.new(@content, status: (@col.status || :primary)).render
    end

  end
end