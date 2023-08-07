module UiBibz
  module Strategies
    # Class to initialize component
    class ComponentInitializeAbstractStrategy
      def initialize(component, component_binding)# content = nil, options = nil, html_options = nil, &block)
        @component = component
        @binding = component_binding
        @content = component_binding.local_variable_get(:content)
        @options = component_binding.local_variable_get(:options)
        @html_options = component_binding.local_variable_get(:html_options)
        @block = component_binding.local_variable_get(:block)
      end

      def tapped?
        false
      end

      private

      def with_indifferent_access(hash)
        (hash || {}).with_indifferent_access
      end
    end
  end
end
