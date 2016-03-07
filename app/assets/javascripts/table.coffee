class Table

  constructor: ->
    @submitPerPageSelect()
    @clearSearch()
    @animeSearchInput()
    @focusSearchInput()
    @initializeSearchInput()

  # Submit form when per_page select changing
  submitPerPageSelect: ->
    $('.table-pagination-per-page select').change () ->
      $(this).parents('form').submit()

  # Clear search
  clearSearch: ->
    $('.table-search-field .clear-search-btn').click () ->
      $(this).prev().val('')
      $(this).parents('form').submit()

  # Resize search field
  animeSearchInput: ->
    $('.table-card input[type=search]').blur ->
      $parent = $(this).parent()
      $parent.removeClass('has-value') if $(this).val() == ''
      $parent.removeClass('is-focused')

  focusSearchInput: ->
    $('.table-card input[type=search]').focus ->
      $(this).parent().addClass('is-focused has-value')

  initializeSearchInput: ->
    $('.table-card input[type=search]').each ->
      $(this).parent().addClass('has-value') if $(this).val() != ''

