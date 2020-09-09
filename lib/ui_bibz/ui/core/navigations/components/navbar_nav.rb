# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a NavbarNav
  #
  # This element is an extend of UiBibz::Ui::Core::Navigations::Nav.
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
  # * +type+ - Symbol
  #   (+:pills+, +:tab+)
  # * +position+ - Symbol
  #   (+:right+, +:left+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::NavbarNav.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::NavbarNav.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.link content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::NavbarNav.new().tap do |n|
  #     n.link 'Test', url: '#test'
  #     n.link 'Test2', url: '#test2', state: :active
  #   end.render
  #
  class NavbarNav < UiBibz::Ui::Core::Navigations::Nav
    # See UiBibz::Ui::Core::Navigations::Nav.initialize

    private

    def component_html_classes
      ['navbar-nav']
    end

    def type
      'navbar-nav'
    end

    def position
      "pull-#{@options[:position]}" unless @options[:position].nil?
    end
  end
end
