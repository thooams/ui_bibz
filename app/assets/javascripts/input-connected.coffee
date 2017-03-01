(($) ->

  updateOptionsHtml = (data, componentTarget) ->
    componentTarget.children('option').remove()
    data.forEach (opt) ->
      componentTarget.append($("<option></option>").attr("value", opt.value).text(opt.text))

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

        if mode == "remote"
          params = if Array.isArray(values) then { ids: values } else { id: values }
          $.ajax({ url: target.url, data: params }).done (data) ->
            updateTargetComponent(data, componentTarget)

        if mode == "local"
          data = target.data || settings.target.data
          data = data.filter (value) ->
            values = [].concat.apply([], [values]) # flatten
            return values.includes(String(value.connect_option_id))

          updateTargetComponent(data, componentTarget)

)(jQuery)
