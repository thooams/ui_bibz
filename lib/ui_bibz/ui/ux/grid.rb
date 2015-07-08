module UiBibz::Ui::Ux

  # Create a Grid
  #
  # This element is an extend of UiBibz::Ui::Ux::Component.
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Grid.new().tap do |g|
  #     ...
  #     g.view content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Exemples
  #
  #  UiBibz::Ui::Ux::Grid.new().tap do |g|
  #    g.view num: 5, position: :left do
  #      'left'
  #    end
  #    g.view position: :right do
  #      'right'
  #    end
  #    g.view({ position: :top}, { class: 'success'}) do
  #      'top'
  #    end
  #    g.view position: :center do
  #      'center'
  #    end
  #    g.view position: :bottom do
  #      'bottom'
  #    end
  #  end.render
  #
  # ==== Helper
  #
  #   grid(options = { tap: true }, html_options = {}) do |g|
  #     g.view(content, options = {}, html_options = {})
  #     g.view(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Grid < UiBibz::Ui::Core::Component

    COL_NUM = 12

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @views = {}
    end

    def view content = nil, options = nil, html_options = nil, &block
      o      = content.kind_of?(Hash) ? content : options
      c      = UiBibz::Ui::Core::Component.new content, options, html_options, &block
      h      = Hash[o[:position], { component: c, num: o[:num]}]
      @views = @views.merge(h)
    end

    def render
      define_col_nums
      UiBibz::Ui::Core::Row.new(class: 'grid') do
        # top
        concat top_view    unless @views[:top].nil?
        # left
        concat left_view   unless @views[:left].nil?
        # center
        concat center_view unless @views[:center].nil?
        # right
        concat right_view  unless @views[:right].nil?
        # bottom
        concat bottom_view unless @views[:bottom].nil?
      end.render
    end

    def view_by_num c, num, item_class
      UiBibz::Ui::Core::Col.new(c.content, c.options.merge({ num: num }), c.class_and_html_options(['col', item_class])).render
    end

    def top_view
      view_by_num @views[:top][:component], COL_NUM, 'grid-top'
    end

    def bottom_view
      view_by_num @views[:bottom][:component], COL_NUM, 'grid-bottom'
    end

    def left_view
      view_by_num @views[:left][:component], @left_val, 'grid-left'
    end

    def center_view
      view_by_num @views[:center][:component], COL_NUM-@left_val-@right_val, 'grid-center'
    end

    def right_view
      view_by_num @views[:right][:component], @right_val, 'grid-right'
    end

    def define_col_nums
      @left_val  = @views[:left].nil? ? 0 : (@views[:left][:num] || 1)
      @right_val = @views[:right].nil? ? 0 : (@views[:right][:num] || 1)
    end

  end
end
