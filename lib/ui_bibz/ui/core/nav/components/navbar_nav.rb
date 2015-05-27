module UiBibz::Ui::Core

  # Create a NavbarNav
  #
  # This element is an extend of UiBibz::Ui::Core::Nav.
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
  #   UiBibz::Ui::Core::NavbarNav.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Nav.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.link content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::NavbarNav.new().tap do |n|
  #     n.link 'Test', url: '#test'
  #     n.link 'Test2', url: '#test2', status: :active
  #   end.render
  #
  class NavbarNav < Nav

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

  private

    def type
      'navbar-nav'
    end

    def position
      "navbar-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
