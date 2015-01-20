module UiBibz::Helpers::MetaHelper

  def ui_bibz_meta_links
    capture do
      # Latest compiled and minified CSS
      concat stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
      # font awesome icons
      concat stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
      # Optional theme
      concat stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css"
      # Jquery is required for boostrap
      concat javascript_include_tag 'https://code.jquery.com/jquery-2.1.1.min.js'
      # Latest compiled and minified JavaScript
      concat javascript_include_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
    end
  end

end
