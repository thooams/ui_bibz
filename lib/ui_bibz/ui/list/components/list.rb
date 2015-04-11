module UiBibz::Ui
  class List < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      if @tap
        @html_options = @options
        @options      = @content || {}
        @content      = nil
      end

      content_tag tag, class_and_html_options('list-group-item') do
        concat @content    if @content
        concat header_html if @body
        concat body_html   if @body
        concat badge_html  if @options[:badge]
      end
    end

    def header content = nil, options = nil, html_options = nil, &block
      @header = Component.new content, options, html_options, &block
      @tap    = true
    end

    def body content = nil, options = nil, html_options = nil, &block
      @body = Component.new content, options, html_options, &block
      @tap  = true
    end

  private

    def header_html
      content_tag :h4, @header.render, class_and_html_options('list-group-item-heading')
    end

    def body_html
      content_tag :p, @body.render, class_and_html_options('list-group-item-text')
    end

    def badge_html
      content_tag :span, @options[:badge], class: 'badge'
    end

    def tag
      @options[:type] == :link ? :a : :li
    end

    def state
      sym = @options[:state] || :default
      "list-group-item-#{ states[sym] }"
    end

  end
end
