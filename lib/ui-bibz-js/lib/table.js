export default class UiBibzTable {

  constructor() {
    this.submitPerPageSelect()
    this.clearSearch()
    this.animeSearchInput()
    this.focusSearchInput()
    this.initializeSearchInput()
  }

  submitPerPageSelect() {
    $('.table-pagination-per-page select').change(function() {
      $(this).parents('form').find('input[name=link_type]').val('per_page')
      $(this).parents('form').submit()
    })
  }

  clearSearch() {
    $('.clear-search-btn').click(function() {
      $(this).parents('form').find('input[type=search]').val('')
      $(this).parents('form').submit()
    })
  }

  animeSearchInput() {
    $('.table-card input[type=search]').blur(function() {
      let parent = $(this).parent()

      if ($(this).val() === '') { parent.removeClass('has-value') }
      parent.removeClass('is-focused')
    })
  }

  focusSearchInput() {
    $('.table-card input[type=search]').focus(function() {
      $(this).parent().addClass('is-focused has-value')
    })
  }

  initializeSearchInput() {
    $('.table-card input[type=search]').each(function() {
      if ($(this).val() !== '') {
        $(this).parent().addClass('has-value')
      }
    })
  }
}
