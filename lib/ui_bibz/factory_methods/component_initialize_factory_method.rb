# frozen_string_literal: true

module UiBibz
  module FactoryMethods
    # Class to initialize component
    class ComponentInitializeFactoryMethod
      def initialize(component, component_binding)#, content = nil, options = nil, html_options = nil, &block)
        @component = component
        @binding = component_binding
        @content = component_binding.local_variable_get(:content)
        @options = component_binding.local_variable_get(:options)
        @html_options = component_binding.local_variable_get(:html_options)
        @block = component_binding.local_variable_get(:block)
      end

      def make
        strategy.new(@component, @binding)#@content, @options, @html_options, &@block)
      end

     private

      def strategy
        if !@block.nil?
          UiBibz::Strategies::ComponentInitializeBlockStrategy
        elsif @content.is_a?(Hash)
          UiBibz::Strategies::ComponentInitializeHashStrategy
        else
          UiBibz::Strategies::ComponentInitializeStandardStrategy
        end
      end
    end
  end
end
