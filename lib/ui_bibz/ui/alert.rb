module UiBibz::Ui
  class Alert < Component

    # Create an alert
    #
    # ==== Signatures
    #
    #   Alert.new(content, type: :success)
    #
    #   Alert.new() do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options('alert').merge({ role: 'alert'}) do
        concat glyph_and_content_html
        concat close_html if @options[:close]
      end
    end



    #<div class="alert alert-warning alert-dismissible" role="alert">
#<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
#<strong>Warning!</strong> Better check yourself, you're not looking too good.
#</div>

  private

    def close_html
      content_tag :button, type: 'button', class: 'close', "data-dismiss" => "alert", "aria-label" => "Close" do
        content_tag :span, "x", "aria-hidden" => true
      end
    end

    def state
      sym = @options[:state] || :info
      "alert-#{ states[sym] }"
    end

  end
end
