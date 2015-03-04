module UiBibz
  module Utils

    def translatize translation, scope: nil, default: []
      ap 'toto'
      internationalization = UiBibz::Utils::Internationalization.new translation, scope: scope, default: default
      internationalization.translate
    end

  end
end
