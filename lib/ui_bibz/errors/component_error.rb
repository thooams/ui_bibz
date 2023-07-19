# frozen_string_literal: true
module UiBibz
  class ComponentError < StandardError
    def initialize(msg = 'Component Error')
      super
    end
  end
end
