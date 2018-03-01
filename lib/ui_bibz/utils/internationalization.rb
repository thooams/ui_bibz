# Transalte with array of translation
#
#   => UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{ @store.model.to_s.underscore }.show", default: defaults).translate
module UiBibz::Utils
  class Internationalization

    def initialize translation, options = {}
      @translation = translation
      @options     = options
    end

    def translate
      I18n.t(@translation, options_with_default)
    end

  private

    def options_with_default
      @options[:default] = translate_default unless @options[:default].nil?
      @options
    end

    # To know if translation missing
    def i18n_set? key
      I18n.t key, :raise => true rescue false
    end

    def translate_default
      I18n.t([*@options[:default]].select{ |translation| i18n_set? translation }.first, default: [*@options[:default]].last)
    end

  end
end
