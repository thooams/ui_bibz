require "ui_bibz/ui/core/lists/components/list/list_header"
require "ui_bibz/ui/core/lists/components/list/list_body"
module UiBibz::Ui::Core::Lists::Components

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
  # * +state+ - status of élement with symbol value:
  #   (+:active+, +:disabled+)
  # * +url+
  # * +tap+ - Boolean to add header and body
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Lists::Components::List.new(tap: true) do |l|
  #     l.header content =  nil, options = nil, html_options = nil, &block
  #     l.body content =  nil, options = nil, html_options = nil, &block
  #   end
  #
  #   UiBibz::Ui::Core::Lists::Components::List.new content, options = nil, html_options = nil
  #
  #   UiBibz::Ui::Core::Lists::Components::List.new options = nil, html_options = nil do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Lists::Components::List.new('Test', status: :success, url: '#test').render
  #
  #   UiBibz::Ui::Core::Lists::Components::List.new(status: :primary) do
  #       'Test 2'
  #   end.render
  #
  #   UiBibz::Ui::Core::List.new(tap: true, state: :active) do |l|
  #     l.header 'My title', nil, class: 'my-title'
  #     l.body do
  #       'My content'
  #     end
  #   end.render
  #
  class List < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag tag_type, html_options do
        concat glyph_and_content_html if @content
        concat header_html if @body
        concat body_html   if @body
        concat tag_html    if @options[:tag]
      end
    end


    # Add header which is a component
    def header content = nil, options = nil, html_options = nil, &block
      @header = UiBibz::Ui::Core::Lists::Components::ListHeader.new content, options, html_options, &block
    end

    # Add body which is a component
    def body content = nil, options = nil, html_options = nil, &block
      @body = UiBibz::Ui::Core::Lists::Components::ListBody.new content, options, html_options, &block
    end

  private

    def component_html_classes
      'list-group-item'
    end

    def header_html
      @header.render
    end

    def body_html
      @body.render
    end

    def tag_type
      if is_link_type?
        :a
      elsif is_button_type?
        :button
      else
        :li
      end
    end

    def is_link_type?
      @html_options[:href] = @options[:url] if @options[:url]
      @options[:type] == :link || @html_options[:type] == :link
    end

    def is_button_type?
      @options[:type] == :button || @html_options[:type] == :button
    end

    def status
      "list-group-item-#{ @options[:status] }" unless @options[:status].nil?
    end

  end
end
