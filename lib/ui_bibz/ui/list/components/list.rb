module UiBibz::Ui
  class List < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag tag, class_and_html_options('list-group-item') do
        concat glyph_and_content_html if @content
        concat header_html if @body
        concat body_html   if @body
        concat badge_html  if @options[:badge]
      end
    end

    def header content = nil, options = nil, html_options = nil, &block
      @header = Component.new content, options, html_options, &block
    end

    def body content = nil, options = nil, html_options = nil, &block
      @body = Component.new content, options, html_options, &block
    end

  private

    def header_html
      content_tag :h4, @header.render, @header.class_and_html_options('list-group-item-heading')
    end

    def body_html
      content_tag :p, @body.render, @body.class_and_html_options('list-group-item-text')
    end

    def tag
      is_link_type? ? :a : :li
    end

    def is_link_type?
      @options[:type] == :link || @html_options[:type] == :link
    end

    def state
      unless @options[:state].nil?
        "list-group-item-#{ states[@options[:state]] }"
      end
    end

  end
end
