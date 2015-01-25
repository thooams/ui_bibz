module UiBibz::Ui
  class Glyph < Ui

    attr_accessor :name

    # Create a glyph
    #
    # ==== Signatures
    #
    #   Glyph.new(name)
    #
    #   Glyph.new({name: 'add', size: 3})
    #
    def initialize content
      if content.kind_of?(Hash)
        @name, @size  = content[:name], content[:size]
      else
        @name = content
      end
    end

    def render
      content_tag :i, '', class: "fa fa-#{@name} fa-#{size}x"
    end

    def size
      @size ||= 1
    end

  end
end
