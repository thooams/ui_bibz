(function() {
  (function($) {
    var appendToElement, hasRefreshButton, updateOptionsHtml, updateTargetComponent, updateTargetRefreshButton;
    updateOptionsHtml = function(data, componentTarget) {
      console.log(data);
      componentTarget.children('option:not([value=""])').remove();
      if (Array.isArray(data)) {
        return appendToElement(data, componentTarget);
      } else {
        return $.each(data, function(k, v) {
          var optgroup;
          updateOptionsHtml(data, componentTarget);
          optgroup = $("<optgroup></optgroup>").attr("label", k);
          appendToElement(v, optgroup);
          return componentTarget.append(optgroup);
        });
      }
    };
    appendToElement = function(data, element) {
      return data.forEach(function(opt) {
        return element.append($("<option></option>").attr("value", opt.value || opt[1]).text(opt.text || opt[0]));
      });
    };
    updateTargetComponent = function(data, componentTarget, component) {
      updateOptionsHtml(data, componentTarget);
      updateTargetRefreshButton(componentTarget, component);
      if (componentTarget.hasClass('multi-column-field')) {
        componentTarget.multiSelect('refresh');
      }
      if (componentTarget.hasClass('dropdown-select-field')) {
        componentTarget.selectpicker('refresh');
      }
      if (componentTarget.hasClass('multi-select-field')) {
        componentTarget.multiselect('rebuild');
      }
      componentTarget.attr("disabled", false);
      componentTarget.removeClass("disabled");
      return componentTarget.change();
    };
    updateTargetRefreshButton = function(componentTarget, component) {
      var refreshBtn;
      if (hasRefreshButton(componentTarget)) {
        refreshBtn = componentTarget.parents('.input-group').find('.input-refresh-button');
        return refreshBtn.attr('value', component.val()).attr('name', component.attr('name'));
      }
    };
    hasRefreshButton = function(component) {
      return component.parents('.input-group').hasClass('field-refresh');
    };
    return $.fn.inputConnected = function(options) {
      var defaults, self, settings;
      defaults = {
        mode: "remote",
        events: "change",
        target: {
          url: null,
          selector: null,
          data: []
        }
      };
      settings = $.extend({}, defaults, options);
      self = this;
      return this.each(function() {
        var component, connect, connectMode, events;
        component = $(this);
        connect = component.data().connect;
        if (connect.targets == null) {
          connect.target = connect.target || {};
          connect.target.url = connect.target.url || settings.target.url;
          connect.target.data = connect.target.data || settings.target.data;
          connect.target.selector = connect.target.selector || settings.target.selector;
        }
        connect.targets = connect.targets || [];
        if (connect.target != null) {
          connect.targets.push(connect.target);
        }
        if (connect == null) {
          return;
        }
        connectMode = connect.mode || settings.mode;
        events = connect.events || settings.events;
        return component.on(events, function(e) {
          var name, values;
          e.preventDefault();
          values = component.val();
          name = component.attr('name');
          name = name != null ? name : "id";
          return connect.targets.forEach(function(target) {
            var componentTarget, data, mode;
            componentTarget = $("" + target.selector);
            mode = target.mode || connectMode;
            if (mode === "remote") {
              let params[name] = values
              $.ajax({
                url: target.url,
                data: params
              }).done(function(data) {
                return updateTargetComponent(data, componentTarget, component);
              });
            }
            if (mode === "local") {
              data = target.data || settings.target.data;
              data = data.filter(function(value) {
                values = [].concat.apply([], [values]);
                return values.includes(String(value.connect_option_id));
              });
              return updateTargetComponent(data, componentTarget, component);
            }
          });
        });
      });
    };
  })(jQuery);

}).call(this);
