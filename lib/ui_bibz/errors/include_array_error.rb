# frozen_string_literal: true

module UiBibz
  class IncludeArrayError < ComponentError
    def initialize(value:, array:)
      super
      @value = value
      @array = array
    end

    def message
      "The value '#{@value}' is not include in the list: #{@array.to_sentence(last_word_connector: ' or ', two_words_connector: ' or ')}"
    end
  end
end
