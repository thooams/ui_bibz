# frozen_string_literal: true

module UiBibz::Utils
  # Utils methods can be used outside of Ui Bibz
  class Screwdriver
    include Singleton

    def self.join_classes(*classes)
      klasses = [*classes].flatten.map(&:to_s).compact.uniq.reject(&:blank?)
      klasses.empty? ? nil : klasses
    end

    def self.exclude_classes(html_classes, *classes)
      klasses = (html_classes || []).flatten.map(&:to_s).reject { |klass_name| [*classes].flatten.include?(klass_name.to_s) || klass_name.blank? }
      klasses.empty? ? nil : klasses
    end

    def self.uniq_word_in_string(str)
      str.split(/\s/).uniq
    end
  end
end
