export default class UiBibzTable {

  constructor(node) {
    this.node = node || document

    this.submitPerPageSelect()
    this.clearSearch()
    this.animeSearchInput()
    this.focusSearchInput()
    this.initializeSearchInput()
  }

  submitPerPageSelect() {
    $('.table-pagination-per-page select', this.node).change(function() {
      $(this).parents('form').find('input[name=link_type]').val('per_page')
      $(this).parents('form').submit()
    })
  }

  clearSearch() {
    $('.clear-search-btn', this.node).click(function() {
      $(this).parents('form').find('input[type=search]').val('')
      $(this).parents('form').submit()
    })
  }

  animeSearchInput() {
    $('.table-card input[type=search]', this.node).blur(function() {
      let parent = $(this).parent()

      if ($(this).val() === '') { parent.removeClass('has-value') }
      parent.removeClass('is-focused')
    })
  }

  focusSearchInput() {
    $('.table-card input[type=search]', this.node).focus(function() {
      $(this).parent().addClass('is-focused has-value')
    })
  }

  initializeSearchInput() {
    $('.table-card input[type=search]', this.node).each(function() {
      if ($(this).val() !== '') {
        $(this).parent().addClass('has-value')
      }
    })
  }
}
