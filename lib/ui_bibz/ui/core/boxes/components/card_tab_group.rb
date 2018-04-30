module UiBibz::Ui::Core::Boxes::Components

  # Create a  card tab group
  #
  # This element is an extend of UiBibz::Ui::Core::Navigation::TabGroup.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  class CardTabGroup < UiBibz::Ui::Core::Navigations::TabGroup

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

  private

    def component_html_classes
      super << "card-header-tabs"
    end

  end
end
