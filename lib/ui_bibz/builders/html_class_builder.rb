# frozen_string_literal: true

class HtmlClassBuilder
  attr_reader :html_classes

  def initialize
    @html_classes = []
  end

  def add(*classes)
    @html_classes << classes
  end

  def remove(*classes)
    @html_classes = @html_classes.flatten.reject { |klass_name| Array(classes).flatten.include?(klass_name.to_s) || klass_name.blank? }
  end

  def to_s
    @html_classes.flatten.uniq.join(' ')
  end

  def to_a
    @html_classes.flatten.uniq
  end
end
