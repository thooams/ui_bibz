# frozen_string_literal: true

module UiBibz::Utils
  # Generate the col class name
  class ColNameGenerator
    POSITIONING = %i[num offset push pull].freeze
    BREAKPOINTS = UiBibz::Ui::Core::Component::BREAKPOINTS
    PARAMETERS =  BREAKPOINTS + POSITIONING

    def initialize(options = {}, klass_name = 'col')
      @options = options
      @klass_name = klass_name
    end

    def class_names
      return @klass_name unless col_options?

      kl = []
      @options.each do |key, value|
        kl << write_classes(key.to_sym, value) if BREAKPOINTS.include?(key.to_sym)
      end
      kl << write_classes(:md, @options) if kl.empty?

      kl
    end

    private

    def col_options?
      (@options.keys.map(&:to_sym) & PARAMETERS).present?
    end

    def write_classes(size, opts)
      opts.map { |k, v| send(k, size, v) if POSITIONING.include?(k.to_sym) }.join(' ')
    end

    # col-md-9
    def num(size, number)
      size == :auto ? @klass_name : "#{@klass_name}-#{size}-#{number}"
    end

    # col-md-offset-9
    def offset(size, number)
      "offset-#{size}-#{number}"
    end

    # col-md-push-9
    def push(size, number)
      "#{@klass_name}-#{size}-push-#{number}"
    end

    # col-md-pull-9
    def pull(size, number)
      "#{@klass_name}-#{size}-pull-#{number}"
    end
  end
end
