module UiBibz::Ui::Core::Progresses::Components

  # Create a bar
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
  # * +status+ - status of élement with symbol value:
  #   (+:secondary+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +max+ - Max value (default: 100)
  # * +min+ - Min value (default: 0)
  # * +value+ - Value of percentage (default: content)
  # * +animated+ - Boolean
  # * +striped+ - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Bar.new(percentage, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Bar.new(options = nil, html_options = nil) do
  #     percentage
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Bar.new(50%, { value: 50})
  #   # or
  #   UiBibz::Ui::Core::Bar.new(10%, { value: 10, status: :success },{ class: 'test' }).render
  #   # or
  #   UiBibz::Ui::Core::Bar.new({ value: 10, status: :success},{ class: 'test' }) do
  #     10%
  #   end.render
  #
  class Bar < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, '', html_options
    end

  private

    def component_html_classes
      ['progress-bar', striped, animated]
    end

    def component_html_options
      { "aria-valuenow": value, "aria-valuemin": min, "aria-valuemax": max, style: "width: #{ value }%", role: 'progressbar' }
    end

    def striped
      'progress-bar-striped' unless options[:striped].nil?
    end

    def animated
      'progress-bar-animated' unless options[:animated].nil?
    end


    def min
      options[:min] || 0
    end

    def max
      options[:max] || 100
    end

    def value
      options[:value] || content.to_f
    end

    def status
      "bg-#{ options[:status] }" unless options[:status].nil?
    end

  end
end
