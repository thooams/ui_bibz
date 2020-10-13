# frozen_string_literal: true

module ConnectExtension
  private

  def component_html_data
    super
    connect_options
  end

  def connect_options_selector
    content.to_s.parameterize.underscore
  end

  def connect_opts
    selector = options[:refresh][:target][:selector]
    options[:refresh][:target][:selector] = selector.presence || "##{connect_options_selector}"

    options[:refresh].merge({
                              connect: {
                                target: options[:refresh].delete(:target),
                                event: options[:refresh].delete(:event),
                                mode: options[:refresh].delete(:mode)
                              }
                            })
  end

  def connect_options
    add_html_data('connect', value: options[:connect]) if options[:connect]
  end
end
