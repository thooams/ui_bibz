module UiBibz::Ui
  class Button < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @group_button = Component.new content, options, html_options, &block
    end

    def render
      content_tag :button, @group_button.render, @group_button.options.merge({ type: 'button' }), class_and_html_options
    end

    def type
      custom = @group_button.html_options[:type] || @group_button.options[:type]
      custom.nil? ? states[:default] : states[custom]
    end

    def class_and_html_options
      @group_button.class_and_html_options(["btn", type])
    end

    def states
      if @states.nil?
        states = {}
        %w(default success primary info waring danger).each do |state|
          states = states.merge(Hash[state.to_sym, "btn-#{ state }"])
        end
        @states = states
      end
      @states
    end

  end
end
