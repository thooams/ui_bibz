# frozen_string_literal: true

module UiBibz::Helpers::UtilsHelper
  # Same method like I18n.translate but accept
  # strings in default argument
  def ui_translatize(translation, options)
    UiBibz::Utils::Internationalization.new(translation, options).translate
  end

  def ui_form_for(object, *args, &)
    options = args.extract_options!
    simple_form_for(object, *(args << new_options(options)), &)
  end

  private

  def new_options(options)
    if options[:html].nil?
      options[:html] = { class: options[:class] }
    elsif options[:html][:class].nil?
      options[:html] = options[:html].merge({ class: options[:class] })
    else
      options[:html][:class] = options[:html][:class] + (options[:class] || '')
    end
    options.merge(builder: UiBibzForm::UiBibzFormBuilder)
  end
end
