import "jquery.quicksearch"

export default {
    qs1: null,
    qs2: null,
    selectableOptgroup: false,
    selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selectable items'><br/>",
    selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selected items'><br/>",
    afterInit: function(ms) {
      var $selectableSearch, $selectionSearch, selectableSearchString, selectionSearchString, that;
      that = this;
      that.options.selectableOptgroup = $(this)[0].$element.data('selectableOptgroup') ? true : false;
      if ($(this)[0].$element.data('searchable')) {
        $selectableSearch = that.$selectableUl.siblings('input');
        $selectionSearch = that.$selectionUl.siblings('input');
        $selectionSearch = that.$selectionUl.siblings('input');
        selectableSearchString = "#" + that.$container.attr("id") + " .ms-elem-selectable:not(.ms-selected)";
        selectionSearchString = "#" + that.$container.attr("id") + " .ms-elem-selection.ms-selected";
        that.qs1 = $selectableSearch.quicksearch(selectableSearchString).on("keydown", function(e) {
          if (e.which === 40) {
            that.$selectableUl.focus();
            return false;
          }
        });
        return that.qs2 = $selectionSearch.quicksearch(selectionSearchString).on("keydown", function(e) {
          if (e.which === 40) {
            that.$selectionUl.focus();
            return false;
          }
        });
      } else {
        that.$selectableContainer.children('.search-input').remove();
        return that.$selectionContainer.children('.search-input').remove();
      }
    },
    afterSelect: function() {
      if (this.qs1 != null) {
        this.qs1.cache();
      }
      if (this.qs2 != null) {
        return this.qs2.cache();
      }
    },
    afterDeselect: function() {
      if (this.qs1 != null) {
        this.qs1.cache();
      }
      if (this.qs2 != null) {
        return this.qs2.cache();
      }
    }
}
