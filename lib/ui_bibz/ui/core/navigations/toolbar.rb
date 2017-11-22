module UiBibz::Ui::Core::Navigations

  # Create a toolbar
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
  # * +status+ - status of element with +symbol+ value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::Toolbar.new(options = nil, html_options = nil) do |bt|
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::Toolbar.new(status: :primary, size: :xs) do |bt|
  #     bt.button_group do |bg|
  #       bg.ui_button 'test 1'
  #       bg.ui_button 'test 2'
  #     end
  #     bt.button_group do |bg|
  #       bg.ui_button 'test 3'
  #       bg.ui_button 'test 4'
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   ui_toolbar(options = {}, html_options = {}) do |bt|
  #     bt.button_group do |bg|
  #       bg.ui_button 'content'
  #       bg.ui_button_link 'Link', url: '#'
  #     end
  #   end
  #
  class Toolbar < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :div, @items.map(&:render).join.html_safe, html_options
    end

    def button_group content = nil, options = nil, html_options = nil, &block
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end
      @items << UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, options, html_options).tap(&block)
    end

    def spacer num = "auto"
      kls = " mr-#{ num }"
      @items.last.html_options[:class].nil? ? @items.last.html_options[:class] = kls : @items.last.html_options[:class] << kls
    end

  private

    def component_html_classes
      super << ["btn-toolbar", justify]
    end

    def component_html_options
      { role: 'toolbar' }
    end

    def justify
      "justify-content-between" if options[:justify]
    end

  end
end
