module UiBibz::Ui::Core

  # Create a NavLink
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
  class NavbarNav < Nav

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

  private

    def type
      'navbar-nav'
    end

  end
end
