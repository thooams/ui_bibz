# frozen_string_literal: true

module UiBibz::Ui::Ux::Containers::Components
  # Create a panel toolbar
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
  #   UiBibz::Ui::Core::Boxes::PanelToolbar.new(options = nil, html_options = nil) do |pt|
  #     pt.button_group do |bg|
  #       bg.button 'My buttton'
  #     end
  #   end
  #
  class PanelToolbar < UiBibz::Ui::Core::Navigations::Toolbar
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    private

    def component_html_classes
      super << ['panel-toolbar']
    end
  end
end
