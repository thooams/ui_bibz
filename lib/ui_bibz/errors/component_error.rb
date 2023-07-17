# frozen_string_literal: true
module UiBibz
  class ComponentError < StandardError
    def initialize(msg = 'Component Error')
      super
    end
  end

  class StatusesError < ComponentError
    def initialize(value:, statuses:)
      super
      @value = value
      @statuses = statuses
    end

    def message
      "The status '#{@value}' is not include in #{@statuses.to_sentence(last_word_connector: ' or ', two_words_connector: ' or ')}"
    end
  end
end
