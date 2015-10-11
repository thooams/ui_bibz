module UiBibz::Ui::Core

  # Create a list
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
  # * +status+ - State of élement with symbol value:
  #   (+:active+, +:disable+)
  # * +url+
  # * +tap+ - Boolean to add header and body
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::List.new(tap: true) do |l|
  #     l.header content =  nil, options = nil, html_options = nil, &block
  #     l.body content =  nil, options = nil, html_options = nil, &block
  #   end
  #
  #   UiBibz::Ui::Core::List.new content, options = nil, html_options = nil
  #
  #   UiBibz::Ui::Core::List.new options = nil, html_options = nil do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::List.new('Test', state: :success, url: '#test').render
  #
  #   UiBibz::Ui::Core::List.new(state: :primary) do
  #       'Test 2'
  #   end.render
  #
  #   UiBibz::Ui::Core::List.new(tap: true, status: :active) do |l|
  #     l.header 'My title', nil, class: 'my-title'
  #     l.body do
  #       'My content'
  #     end
  #   end.render
  #
  class List < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag tag, class_and_html_options('list-group-item') do
        concat glyph_and_content_html if @content
        concat header_html if @body
        concat body_html   if @body
        concat label_html  if @options[:label]
      end
    end


    # Add header which is a component
    def header content = nil, options = nil, html_options = nil, &block
      @header = Component.new content, options, html_options, &block
    end

    # Add body which is a component
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
      @html_options[:href] = @options[:url] if @options[:url]
      @options[:type] == :link || @html_options[:type] == :link
    end

    def state
      unless @options[:state].nil?
        "list-group-item-#{ states[@options[:state]] }"
      end
    end

  end
end
