module UiBibz::Ui::Ux

  # Create a Thead
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
  # * +state+ - State of élement with symbol value:
  #   (+:inverse+, +:default+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Thead.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Ux::Thead.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Ux::Thead.new(content, { state: :inverse }).render
  #
  class Thead < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :thead, content, html_options
    end

    private

    def state
      "thead-#{ @options[:state] }" unless @options[:state].nil?
    end

  end
end
