# frozen_string_literal: true

module UiBibz::Utils
  # Utils methods can be used outside of Ui Bibz
  class Screwdriver
    include Singleton

    class << self
      def join_classes(*classes)
        klasses = Array(classes).flatten.filter_map(&:to_s).uniq.compact_blank
        klasses.empty? ? nil : klasses
      end

      def exclude_classes(html_classes, *classes)
        klasses = (html_classes || []).flatten.map(&:to_s).reject { |klass_name| Array(classes).flatten.include?(klass_name.to_s) || klass_name.blank? }
        klasses.empty? ? nil : klasses
      end

      def uniq_word_in_string(str)
        str.split(/\s/).uniq
      end

      def tapped?(block)
        block.present? && block.parameters.present?
      end
    end
  end
end
