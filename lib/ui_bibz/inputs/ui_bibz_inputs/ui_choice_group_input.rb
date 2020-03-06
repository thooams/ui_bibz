# frozen_string_literal: true

module UiBibzInputs
  class UiChoiceGroupInput < CollectionInput #::Inputs::CollectionRadioButtonsInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options = nil)
      label_method, value_method = detect_collection_methods # rubocop:disable Lint/UselessAssignment

      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options) # rubocop:disable Lint/UselessAssignment

      UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(input_options).tap do |bc|
        collection.each do |item|
          opts = { name: "#{@builder.object.class.name.underscore}[#{attribute_name}]", value: item[1] }
          opts = opts.merge({ state: :active }) if @builder.object.send(attribute_name).to_s == item[1].to_s
          bc.button item[0], opts
        end
      end.render
    end
  end
end
