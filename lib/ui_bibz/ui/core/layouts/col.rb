# frozen_string_literal: true

module UiBibz::Ui::Core::Layouts
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
  # * +xxl+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Layouts::Col.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Layouts::Col.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Layouts::Col.new('content', { num: 2, offset: 1 }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Layouts::Col.new(xs: { num: 2, pull: 1, push: 1}, md: { num: 3 }, { class: 'test' }) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   col(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class Col < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      content = { num: content } if !block.nil? && content.is_a?(Integer)
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, content, html_options
    end

    private

    def component_html_classes
      UiBibz::Utils::BreakdownClassNameGenerator.new(@options).class_names
    end
  end
end
