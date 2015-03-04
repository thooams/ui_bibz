module UiBibz::Utils
  class Internationalization

    def initialize translation, scope: nil, default: []
      @translation = translation
      @scope       = scope
      @default     = default
    end

    def translate
      t(@translation, scope: scope, default: translate_default)
    end

  private

    # To know if translation missing
    def i18n_set? key
      I18n.t key, :raise => true rescue false
    end

    def translate_default
      @default.each do |translation|
        if i18n_set? translation
          return t(translation)
          break
        end
      end
    end

  end

  def translate translation, scope: nil, default: []
    internationalization = Internationalization.new translation, scope: scope, default: default
    internationalization.translate
  end
end
