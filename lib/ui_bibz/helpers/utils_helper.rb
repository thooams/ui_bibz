module UiBibz::Helpers::UtilsHelper

  # Same method like I18n.translate but accept
  # strings in default argument
  def ui_translatize translation, options
    UiBibz::Utils::Internationalization.new(translation, options).translate
  end

  def ui_form_for object, *args, &block
    options = args.extract_options!
    ap options
    simple_form_for(object, *(args << options.merge(builder: UiBibzForm::UiBibzFormBuilder)), &block)
  end


end
