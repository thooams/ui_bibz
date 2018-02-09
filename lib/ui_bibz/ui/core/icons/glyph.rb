module UiBibz::Ui::Core::Icons

  # Create a glyph
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +name+ - String
  # * +size+ - Integer
  # * +type+ - Symbol
  # * +text+ - String
  # * +status+ - Symbol
  #   (+:secondary+, +:primary+, +:info+, +:warning+, +:danger+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new content = nil, options = nil, html_options = nil,
  #   &block
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new content = {}
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new content, options = {}, html_options = {}
  #
  # ==== Exemples
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new('eye').render
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new() do
  #     name
  #   end.render
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new('eye', { size: 3, type: 'fw' }).render
  #
  #   UiBibz::Ui::Core::Icons::Glyph.new({ name: 'eye', size: 3, type: 'fw' }).render
  #
  # ==== Helper
  #
  #   glyph(options = {})
  #
  #   glyph(name, options = {}, html_options = {})
  #
  #   glyph(options = {}, html_options = {}) do
  #     name
  #   end
  class Glyph < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      [content_tag(:i, '', html_options), options[:label]].compact.join(' ').html_safe
    end

  private

    def component_html_classes
      join_classes(classes)
    end

    def classes
      cls = ["glyph", style, "fa-#{ content }"]
      cls << "fa-#{ size }x"         unless size.nil?
      cls << "fa-rotate-#{ rotate }" unless rotate.nil?
      cls << "fa-flip-#{ flip }"     unless flip.nil?
      cls << "fa-inverse"            unless inverse.nil?
      cls << "fa-stack-#{ stack }x"  unless stack.nil?
      cls << "fa-#{ type }"          unless type.nil?
      cls
    end

    def size
      case @options[:size]
      when :sm
        1
      when :md
        3
      when :lg
        5
      else
        @options[:size]
      end
    end

    def style
      match_style[@options[:style] || :solid]
    end

    def stack
      @options[:stack]
    end

    def rotate
      @options[:rotate]
    end

    def inverse
      @options[:inverse]
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

    def status
      "glyph-#{ @options[:status] }" unless @options[:status].nil?
    end

    def match_style
      {solid: 'fas', regular: 'far', light: 'fal', brands: 'fab'}
    end

  end
end
