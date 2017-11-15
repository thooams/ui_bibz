module UiBibz::Ui::Core::Icons

  # Create star notation
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
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +num+ - Integer, number of star
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Icons::Star.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Icons::Star.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Icons::Star.new(content, status: :success).render
  #
  #   UiBibz::Ui::Core::Icons::Star.new({ num: 10 }) do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   star(content, options = {}, html_options = {})
  #
  #   star(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Star < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :span, star_notation.join(' ').html_safe, html_options
    end

  private


    def component_html_classes
      'stars-notation'
    end

    def number
      (options[:num] || 5).to_i
    end

    def star_notation
      stars = []
      number.times do |star|
        star += 1
        name = star_name(star)
        stars << UiBibz::Ui::Core::Icons::Glyph.new(name, glyph_opts).render
      end
      stars
    end

    def glyph_opts
      opts = {}
      opts = opts.merge({ status: options[:status] }) unless options[:status].nil?
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
