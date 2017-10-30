module UiBibz::Utils
  class Screwdriver
    include Singleton

    def self.join_classes *classes
      klasses = [*classes].flatten.compact.uniq.reject(&:blank?)
      klasses.empty? ? nil : klasses
    end

  end
end
