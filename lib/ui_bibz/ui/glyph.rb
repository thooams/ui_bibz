module UiBibz::Ui
  class Glyph < Component

    # Create a glyph
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Glyph.new(name)
    #
    #   UiBibz::Ui::Glyph.new('add', { size: 3, type: 'fw' })
    #
    #   UiBibz::Ui::Glyph.new({ name: 'add', size: 3, type: 'fw' })
    #
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :i, '', class_and_html_options(classes)
    end

    def classes
      cls = ["glyph", "fa", "fa-#{ content }"]
      cls << "fa-#{ size }x"         unless size.nil?
      cls << "fa-rotate-#{ rotate }" unless rotate.nil?
      cls << "fa-flip-#{ flip }"     unless flip.nil?
      cls << "fa-stack-#{ stack }x"  unless stack.nil?
      cls << "fa-#{ type }"          unless type.nil?
      cls.compact.join(' ')
    end

    def size
      @options[:size]
    end

    def stack
      @options[:stack]
    end

    def rotate
      @options[:rotate]
    end

    def flip
      @options[:flip]
    end

    def type
      @options[:type]
    end

    def content
      @options[:name] || @content
    end

  end
end
