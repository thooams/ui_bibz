(($) ->

  updateOptionsHtml = (data, componentTarget) ->
    componentTarget.children('option').remove()

    if Array.isArray(data)
      appendToElement(data, componentTarget)
    else
      $.each data, (k,v) ->
        optgroup = $("<optgroup></optgroup>").attr("label", k)
        appendToElement(v, optgroup)
        componentTarget.append(optgroup)

  appendToElement = (data, element) ->
    data.forEach (opt) ->
      element.append($("<option></option>").attr("value", opt.value).text(opt.text))

  updateTargetComponent = (data, componentTarget) ->
    updateOptionsHtml(data, componentTarget)
    componentTarget.multiSelect('refresh')  if componentTarget.hasClass('multi-column')
    componentTarget.selectpicker('refresh') if componentTarget.hasClass('selectpicker')
    componentTarget.multiselect('rebuild')  if componentTarget.hasClass('multi-select')

  $.fn.inputConnected = (options) ->

    defaults =
      mode:        "remote"
      events:      "change"  # change, click, ...
      target:
        url:        null     # url for remote connection
        selector:   null     # component target id
        data: []             # data for local connection
        # Add a proxy
        # Proxy:
        #  url:    null
        #  method: 'GET'
        #  data:   null

    settings = $.extend({}, defaults, options)

    self = this
    return this.each ->
      component = $(this)
      connect   = component.data().connect
      connect.target = connect.target || {}
      return unless connect?

      mode        = connect.mode   || settings.mode
      events      = connect.events || settings.events
      target      =
        url:       connect.target.url       || settings.target.url
        data:      connect.target.data      || settings.target.data
        selector:  connect.target.selector  || settings.target.selector

      componentTarget = $("#{ target.selector }")

      component.on events, (e) ->
        e.preventDefault()
        componentTarget.empty()
        values = component.val()

        name = component.attr('name')
        name = if name? then name.replace(' ', '_').split('[')[0] else "id"
        name = if Array.isArray(values) then "#{ name }s" else name

        if mode == "remote"
          params = { "#{ name }": values }
          $.ajax({ url: target.url, data: params }).done (data) ->
            updateTargetComponent(data, componentTarget)

        if mode == "local"
          data = target.data || settings.target.data
          data = data.filter (value) ->
            values = [].concat.apply([], [values]) # flatten
            return values.includes(String(value.connect_option_id))

          updateTargetComponent(data, componentTarget)

)(jQuery)
