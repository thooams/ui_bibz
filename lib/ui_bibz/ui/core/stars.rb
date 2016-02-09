module UiBibz::Ui::Core

  # Create stars notation
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
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +num+ - Integer, number of stars
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Stars.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Stars.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Stars.new(content, state: :success).render
  #
  #   UiBibz::Ui::Core::Stars.new({ num: 10 }) do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   stars(content, options = {}, html_options = {})
  #
  #   stars(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Stars < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :span, stars_notation.join(' ').html_safe, html_options
    end

  private


    def component_html_classes
      'stars-notation'
    end

    def number
      options[:num] || 5
    end

    def stars_notation
      stars = []
      number.to_i.times do |star|
        star = star + 1
        name = star_name(star)
        stars << UiBibz::Ui::Core::Glyph.new(name, glyph_opts).render
      end
      stars
    end

    def glyph_opts
      opts = {}
      opts = opts.merge({ state: options[:state] }) unless options[:state].nil?
      opts = opts.merge({ size: options[:size] })   unless options[:size].nil?
      opts
    end

    def star_name star
      if star <= content
        'star'
      elsif star > content && !content.is_a?(Integer) && star < content + 1
        'star-half-o'
      else
        'star-o'
      end
    end

  end
end
