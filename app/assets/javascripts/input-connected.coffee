(($) ->

  updateOptionsHtml = (data, componentTarget) ->
    data.forEach (opt) ->
      componentTarget.append($("<option></option>").attr("value", opt.value).text(opt.text))

  $.fn.inputConnected = (options) ->

    defaults =
      type:        "remote"
      events:      "change"  # change, click, ...
      target:
        url:        null           # url for remote connection
        selector:   null           # component target id
        data: []             # data for local connection
        component:  "select" # type of component
        # Add a proxy
        # Proxy:
        #  url:    null
        #  method: 'GET'
        #  data:   null

    settings = $.extend({}, defaults, options)

    self = this
    return this.each ->
      connect = $(this).data().connect
      console.log $(this)
      connect.target = connect.target || {}
      return unless connect?

      type        = connect.type      || settings.type
      events      = connect.events    || settings.events
      target      =
        url:       connect.target.url       || settings.target.url
        data:      connect.target.data      || settings.target.data
        selector:  connect.target.selector  || settings.target.selector
        component: connect.target.component || settings.target.component

      componentTarget = $("#{ target.selector }")

      $(this).on events, (e) ->
        e.preventDefault()
        componentTarget.empty()

        if type == "remote"
          $.ajax({ url: target.url }).done (data) ->
            updateOptionsHtml(data, componentTarget) if target.component == "select"

        if type == "local"
          data               = target.data || settings.target.data
          connect_option_id  = $(this).children("option:selected").val()

          data               = data.filter (value) ->
            return Number(value.connect_option_id) == Number(connect_option_id)

          updateOptionsHtml(data, componentTarget) if target.component == "select"

)(jQuery)
