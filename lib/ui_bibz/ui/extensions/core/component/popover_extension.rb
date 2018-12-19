module PopoverExtension

  def popover_data_html
    unless options[:popover].blank?
      add_html_data :toggle, "popover"
      add_html_data :content, (options[:popover].kind_of?(String) ? options[:popover] : options[:popover][:content])
    end
    if options[:popover].kind_of?(Hash)
      add_html_data :title, options[:popover].try(:[], :title)         unless options[:popover].try(:[], :title).nil?
      add_html_data :placement, options[:popover].try(:[], :position)  unless options[:popover].try(:[], :position).nil?
      add_html_data :trigger, options[:popover].try(:[], :trigger)     unless options[:popover].try(:[], :trigger).nil?
      add_html_data :template, options[:popover].try(:[], :template)   unless options[:popover].try(:[], :template).nil?
      add_html_data :animation, options[:popover].try(:[], :animation) unless options[:popover].try(:[], :animation).nil?
      add_html_data :html, options[:popover].try(:[], :html)           unless options[:popover].try(:[], :html).nil?
    end
  end

end
