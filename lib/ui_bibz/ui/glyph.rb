module UiBibz::Ui
  class Glyph < Ui

    attr_accessor :name

    # Create a glyph
    #
    # ==== Signatures
    #
    #   Glyph.new(name)
    #
    #   Glyph.new('add', { size: 3, type: 'fw' })
    #
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :i, '', class_and_html_options(classes)
    end

    def classes
      cls = ["glyph", "fa", "fa-#{ @content }", "fa-#{ size }x"]
      cls << "fa-#{type}" unless type.nil?
      cls.compact.join(' ')
    end

    def size
      @options[:size] ||= 1
    end

    def type
      @options[:type]
    end

  end
end
