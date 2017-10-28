require 'ui_bibz/ui/core/progresses/components/bar'
module UiBibz::Ui::Core::Progresses

  # Create a progress bar
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
  # * +value+ - Value of percentage (default: content)
  # * +animated+ - Boolean
  # * +striped+ - Boolean
  # * +stacked+ - Boolean
  # * +line+ - Boolean
  #
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::ProgressBar.new(percentage, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::ProgressBar.new(options = nil, html_options = nil) do
  #     percentage
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ProgressBar.new(50%, { value: 50})
  #   # or
  #   UiBibz::Ui::Core::ProgressBar.new(10%, { value: 10, status: :success },{ class: 'test' }).render
  #   # or
  #   UiBibz::Ui::Core::ProgressBar.new({ value: 10, status: :success},{ class: 'test' }) do
  #     10%
  #   end.render
  #
  # ==== Helper
  #
  #   ui_progress_bar(integer, options = {}, html_options = {})
  #
  #   ui_progress_bar(options = { tap: true }, html_options = {}) do |pb|
  #     pb.bar(integer, options = {}, html_options = {})
  #     pb.bar(options = {}, html_options = {}) do
  #       integer
  #     end
  #   end
  #
  class ProgressBar < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @bars = []
    end

    # Render html tag
    def render
      content_tag :div, bars.join.html_safe, html_options
    end

    def bar content = nil, options = nil, html_options = nil, &block
      @bars << UiBibz::Ui::Core::Progresses::Components::Bar.new(content, options, html_options, &block).render
    end

  private

    def component_html_classes
      ['progress', line]
    end

    def bars
      if @bars.size > 0
        @bars
      elsif options[:stacked]
        stacked_bars
      else
        [UiBibz::Ui::Core::Progresses::Components::Bar.new(content, options).render]
      end
    end

    def line
      "progress-bar-line" if options[:line]
    end

    def stacked_bars
      percentages = [7.4, 15.3, 21.1, 25.9, 30.3, 100]
      stacked_colors.map.with_index do |color, i|
        if percentages[0, i].sum <= content.to_f
          if content.to_f.between?(percentages[0, i].sum , percentages[0, i+1].sum)
            UiBibz::Ui::Core::Progresses::Components::Bar.new((content.to_f*percentages[i]/100), min: 0, striped: options[:striped], animated: options[:animated], max: 100, status: color).render
          else
            UiBibz::Ui::Core::Progresses::Components::Bar.new(percentages[i], min: 0, striped: options[:striped], animated: options[:animated], max: 100, status: color).render
          end
        end
      end
    end

    def stacked_colors
      if options[:inverse]
        %i(success primary info warning danger).reverse
      else
        %i(success primary info warning danger)
      end
    end

  end
end
