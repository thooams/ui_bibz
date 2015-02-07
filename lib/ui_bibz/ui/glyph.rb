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
        @name, @size, @type = content[:name], content[:size], content[:type]
      else
        @name = content
      end
    end

    def render
      content_tag :i, '', class: klass
    end

    def klass
      cls = ["glyph", "fa", "fa-#{@name}", "fa-#{size}x"]
      cls << "fa-#{type}" unless type.nil?
      cls.join(' ')
    end

    def size
      @size ||= 1
    end

    def type
      @type
    end

  end
end
