module UiBibz::Ui

  # Create a NavLink
  #
  # This element is an extend of UiBibz::Ui::Component.
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
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * label - String (default: "percentage%")
  # * percentage_min - Integer (default: 0)
  # * percentage_max - Integer (default: 100)
  # * sr_only - Boolean to show label (default: false)
  # * type
  #   (+:striped+, +:animated+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Bar.new(percentage, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Bar.new(options = nil, html_options = nil) do
  #     percentage
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Bar.new(10)
  #   # or
  #   UiBibz::Ui::Bar.new(10, { state: :success, sr_only: true, label: 'Loading...' },{ class: 'test' }).render
  #   # or
  #   UiBibz::Ui::Bar.new({ state: :primary }) do
  #     40
  #   end.render
  #
  class Bar < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, progressbar_inner_html, class_and_html_options(['progress-bar', type]).merge(bar_html_options)
    end

  private

    def bar_html_options
      {
        "role"          => 'progressbar',
        "aria-valuenow" => percentage,
        "aria-valuemin" => percentage_min,
        "aria-valuemax" => percentage_max,
        "style"         => "width: #{ percentage }%"
      }
    end

    def progressbar_inner_html
      sr_only ? content_tag(:span, label, class: 'sr-only') : label
    end

    def percentage
      @content || 0
    end

    def sr_only
      @options[:sr_only] || false
    end

    def percentage_min
      @options[:percentage_min] || 0
    end

    def percentage_max
      @options[:percentage_max] || 100
    end

    def label
      @options[:label].nil? ? "#{ percentage }%" : @options[:label]
    end

    def type
      if @options[:type] == :animated
        "progress-bar-striped active"
      elsif @options[:type]
        "progress-bar-#{ @options[:type] }"
      end
    end

    def state
      "progress-bar-#{ @options[:state] }" unless @options[:state].nil?
    end

  end
end
