# frozen_string_literal: true

module UiBibz
  module Strategies
    # Class to initialize component
    class ComponentInitializeBlockStrategy < UiBibz::Strategies::ComponentInitializeAbstractStrategy
      def content
        context = eval('self', @block.binding) # rubocop:disable Style/EvalWithLocation
        read_cache.nil? ? context.capture(&@block) : read_cache
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
        return if @options.try(:[], :cache).blank?

        ::Rails.cache.read(@options.try(:[], :cache))
      end
    end
  end
end
