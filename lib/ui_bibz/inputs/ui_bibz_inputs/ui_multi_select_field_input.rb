# frozen_string_literal: true

module UiBibzInputs
  class UiMultiSelectFieldInput < UiDropdownSelectFieldInput
    def new_options
      (super || {}).merge(multiple: true)
    end
  end
end
