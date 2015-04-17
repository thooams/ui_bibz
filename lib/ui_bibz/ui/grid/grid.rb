module UiBibz::Ui
  class Grid < Component

    COL_NUM = 12

    # Create a row
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Grid.new().tap |g|
    #     g.view({ position: :top, cols: {size: :lg, num: 1} ) do
    #       'test'
    #     end
    #     g.view({ position: :top, cols: {size: :lg, num: 1}, { num: 3 }) do
    #       'test'
    #     end
    #     g.view position: :right, width: 120
    #     g.view position: :bottom, width: 150
    #     g.view position: :left,  width: 170
    #     g.view position: :center, width: 300
    #   end
    #
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @views = {}
    end

    def view content = nil, options = nil, html_options = nil, &block
      o      = content.kind_of?(Hash) ? content : options
      c      = UiBibz::Ui::Component.new content, options, html_options, &block
      h      = Hash[o[:position], { component: c, num: o[:num]}]
      @views = @views.merge(h)
    end

    def render
      define_col_nums
      UiBibz::Ui::Row.new do
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

    def view_by_num c, num
      UiBibz::Ui::Col.new(c.content, c.options.merge({ num: num }), c.html_options).render
    end

    def top_view
      view_by_num @views[:top][:component], COL_NUM
    end

    def bottom_view
      view_by_num @views[:bottom][:component], COL_NUM
    end

    def left_view
      view_by_num @views[:left][:component], @left_val
    end

    def center_view
      view_by_num @views[:center][:component], COL_NUM-@left_val-@right_val
    end

    def right_view
      view_by_num @views[:right][:component], @right_val
    end

    def define_col_nums
      @left_val  = @views[:left].nil? ? 0 : (@views[:left][:num] || 1)
      @right_val = @views[:right].nil? ? 0 : (@views[:right][:num] || 1)
    end

  end
end
