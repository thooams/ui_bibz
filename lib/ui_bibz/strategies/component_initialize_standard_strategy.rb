# frozen_string_literal: true

module UiBibz
  module Strategies
    # Class to initialize component
    class ComponentInitializeStandardStrategy < UiBibz::Strategies::ComponentInitializeAbstractStrategy
      attr_reader :content

      def options
        with_indifferent_access(@options)
      end

      def html_options
        with_indifferent_access(@html_options)
      end
    end
  end
end
