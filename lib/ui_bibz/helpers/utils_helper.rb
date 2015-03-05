module UiBibz::Helpers::UtilsHelper

  # Same method like I18n.translate but accept
  # strings in default argument
  def translatize translation, options
    UiBibz::Utils::Internationalization.new(translation, options).translate
  end

end
