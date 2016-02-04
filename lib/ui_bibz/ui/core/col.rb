module UiBibz::Ui::Core

  # Create a col
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # size are xs, sm, md, lg, xl
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
  # * +num+ - Integer | 0..12
  # * +offset+ - Integer
  # * +pull+ - Integer
  # * +push+ - Integer
  # * +xs+ - Hash
  # * +sm+ - Hash
  # * +md+ - Hash
  # * +lg+ - Hash
  # * +xl+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Col.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Col.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Col.new('content', { num: 2, offset: 1 }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Col.new(xs: { num: 2, pull: 1, push: 1}, md: { num: 3 }, { class: 'test' }) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   col(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class Col < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, @content, class_and_html_options(col_classes)
    end

  private

    def col_classes
      kl = []
      @options.each do |ke,va|
        kl << write_classes(ke, va) if %i(xs sm md lg xl).include?(ke)
      end
      kl << write_classes(:md, @options) if kl.empty?
      kl.join(' ')
    end

    def write_classes size, opts
      opts.map{ |k, v| send(k, size.to_sym, v) if %i(num offset push pull).include?(k) }.join(' ')
    end

    # col-md-9
    def num size, n
      "col-#{ size }-#{ n }"
    end

    # col-md-offset-9
    def offset size, n
      "col-#{ size }-offset-#{ n }"
    end

    # col-md-push-9
    def push size, n
      "col-#{ size }-push-#{ n }"
    end

    # col-md-pull-9
    def pull size, n
      "col-#{ size }-pull-#{ n }"
    end

  end
end
