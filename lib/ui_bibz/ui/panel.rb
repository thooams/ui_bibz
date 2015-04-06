module UiBibz::Ui
  class Panel < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def header content = nil, options = nil, html_options = nil, &block
      @header = Component.new content, options, html_options, &block
      @tap    = true
    end

    def body content = nil, options = nil, html_options = nil, &block
      @body = Component.new content, options, html_options, &block
      @tap  = true
    end

    def footer content = nil, options = nil, html_options = nil, &block
      @footer = Component.new content, options, html_options, &block
      @tap    = true
    end

    def render
      if @tap
        @html_options = @options
        @options      = @content || {}
        @content      = nil
      end

      content_tag :div, class_and_html_options("panel") do
        concat(header_html) unless @header.nil?
        concat(body_html)   if !@body.nil? || !@content.nil?
        concat(footer_html) unless @footer.nil?
      end
    end

    def state
      sym = @options[:state] || :default
      "panel-#{ states[sym] }"
    end

  protected

    def header_html
      content_tag :div, @header.render, @header.class_and_html_options("panel-heading")
    end

    def body_html
      @body = Component.new @content unless @content.nil?
      content_tag :div, @body.render, @body.class_and_html_options("panel-body")
    end

    def footer_html
      content_tag :div, @footer.render, @footer.class_and_html_options("panel-footer")
    end

  end
end
