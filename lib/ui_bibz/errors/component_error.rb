# frozen_string_literal: true
module UiBibz
  class ComponentError < StandardError
    def initialize(msg = 'Component Error')
      super
    end
  end

  class StatusError < ComponentError
    def initialize(value:, status:)
      super
      @value = value
      @status = status
    end

    def message
      "The status '#{@value}' is not include in #{@status.to_sentence(last_word_connector: ' or ', two_words_connector: ' or ')}"
    end
  end
end
