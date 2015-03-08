module UiBibz::Ui
  class ButtonLink < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @button_link = Component.new content, options, html_options, &block
    end

    def render
      link_to @button_link.render, @button_link.options, class_and_html_options
    end

  private

    def type
      custom = @button_link.html_options.delete(:type) || (@button_link.options.delete(:type) if @button_link.options.kind_of?(Hash))
      custom.nil? ? states[:default] : states[custom.to_sym]
    end

    def class_and_html_options
      @button_link.class_and_html_options(["btn", type])
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
