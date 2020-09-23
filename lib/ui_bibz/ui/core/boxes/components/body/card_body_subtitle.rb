# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes::Components::Body
  # Create a card block title
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Boxes::CardBodyTitle.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardBodyTitle.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardBodyTitle.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardBodyTitle.new do
  #     'Exemple'
  #   end.render
  #
  class CardBodySubtitle < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :h6, content, html_options
    end

    private

    def component_html_classes
      'card-subtitle mb-2 text-muted'
    end
  end
end
