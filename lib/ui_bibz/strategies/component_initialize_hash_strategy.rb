# frozen_string_literal: true

module UiBibz
  module Strategies
    # Class to initialize component
    class ComponentInitializeHashStrategy < UiBibz::Strategies::ComponentInitializeAbstractStrategy
      def content; end

      def options
        with_indifferent_access(@content)
      end

      def html_options
        with_indifferent_access(@options)
      end
    end
  end
end
