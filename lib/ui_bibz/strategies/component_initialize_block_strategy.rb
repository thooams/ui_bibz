# frozen_string_literal: true

module UiBibz
  module Strategies
    # Class to initialize component
    class ComponentInitializeBlockStrategy < UiBibz::Strategies::ComponentInitializeAbstractStrategy
      def content
        read_cache.nil? ? @component.capture(&@block) : read_cache
      end

      def options
        with_indifferent_access(@content)
      end

      def html_options
        with_indifferent_access(@options)
      end

      def tapped?
        UiBibz::Utils::Screwdriver.tapped?(@block)
      end

      private

      def read_cache
        ::Rails.cache.read(@options.try(:[], :cache))
      end
    end
  end
end
