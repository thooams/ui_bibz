# frozen_string_literal: true

module UiBibz::Ui::Core::Layouts
  # Create a row
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
  # * +type+ - Symbol | :form
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Layouts::Row.new(content, options = {}, html_options = {})
  #
  #   UiBibz::Ui::Core::Layouts::Row.new(options = {}, html_options = {}) do
  #     #content
  #   end
  #
  #   UiBibz::Ui::Core::Layouts::Row.new(options = {}, html_options = {}) do |row|
  #     row.col do
  #       # content
  #     end
  #   end
  #
  # ==== Helper
  #
  #  row(content, options = {}, html_options = {})
  #
  #  row(options = {}, html_options = {}) do
  #    content
  #  end
  #
  #  row(options = {}, html_options = {}) do |row|
  #    row.col do
  #      content
  #    end
  #  end
  #
  class Row < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      unless block.nil?
        content = content.is_a?(Integer) ? { num: content } : content
      end
      super
      @items = [@content]
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def col(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Core::Layouts::Col.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      [
        'row',
        (UiBibz::Utils::BreakdownClassNameGenerator.new(@options[:gutters], 'g').class_names if @options[:gutters]),
        (UiBibz::Utils::BreakdownClassNameGenerator.new(@options, 'row-cols').class_names if breakpoints_present?)
      ]
    end

    def breakpoints_present?
      @options.keys.size - (@options.keys.map(&:to_sym) - [UiBibz::Ui::Core::Component::BREAKPOINTS, :num].flatten).size != 0
    end
  end
end
