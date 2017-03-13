(($) ->

  updateOptionsHtml = (data, componentTarget) ->
    componentTarget.children('option:not([value=""])').remove()

    if Array.isArray(data)
      appendToElement(data, componentTarget)
    else
      $.each data, (k,v) ->
        updateOptionsHtml(data, componentTarget)
        optgroup = $("<optgroup></optgroup>").attr("label", k)
        appendToElement(v, optgroup)
        componentTarget.append(optgroup)

  appendToElement = (data, element) ->
    data.forEach (opt) ->
      element.append($("<option></option>").attr("value", opt.value).text(opt.text))

  updateTargetComponent = (data, componentTarget, component) ->
    updateOptionsHtml(data, componentTarget)
    updateTargetRefreshButton(componentTarget, component)
    componentTarget.multiSelect('refresh')  if componentTarget.hasClass('multi-column-field')
    componentTarget.selectpicker('refresh') if componentTarget.hasClass('dropdown-select-field')
    componentTarget.multiselect('rebuild')  if componentTarget.hasClass('multi-select-field')
    componentTarget.change()

  updateTargetRefreshButton = (componentTarget, component) ->
    if hasRefreshButton(componentTarget)
      refreshBtn = componentTarget.parents('.input-group').find('.input-refresh-button')
      refreshBtn.attr('value', component.val()).attr('name', component.attr('name'))

  hasRefreshButton = (component) ->
    component.parents('.input-group').hasClass('field-refresh')

  $.fn.inputConnected = (options) ->

    defaults =
      mode:        "remote"  # String: remote || local
      events:      "change"  # String: change, click, ...
      target:
        url:        null     # String: url for remote connection
        selector:   null     # String: component target id or class
        data: []             # Array : data for local connection
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
        values = component.val()

        name = component.attr('name')
        name = if name? then name.replace(' ', '_').split('[')[0] else "id"
        name = if Array.isArray(values) then "#{ name }s" else name

        if mode == "remote"
          params = { "#{ name }": values }
          $.ajax({ url: target.url, data: params }).done (data) ->
            updateTargetComponent(data, componentTarget, component)

        if mode == "local"
          data = target.data || settings.target.data
          data = data.filter (value) ->
            values = [].concat.apply([], [values]) # flatten
            return values.includes(String(value.connect_option_id))

          updateTargetComponent(data, componentTarget, component)

)(jQuery)
