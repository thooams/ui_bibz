# frozen_string_literal: true

module UiBibz::Ui::Core::Lists::Components
  # Create a listHeader
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
  class ListHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat content_tag(:h5, content, class: 'mb-1')
        concat content_tag(:small, options[:extra])
      end
    end

    private

    def component_html_classes
      super << %w[d-flex w-100 justify-content-between]
    end
  end
end
