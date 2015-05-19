window.EpicLogger = (->
  menuResize: ->
    $(window).on 'resize', ->
    if $(window).width() <= 992
      $('#collapse_menu').removeClass 'in'
    else
      $('#collapse_menu').addClass 'in'

    $(window).trigger 'resize'

  sidebarToggle: ->
    $('#sidebar .selectbox > p').on 'click', (e) ->
      select = $('#sidebar .selectbox');
      if select.hasClass 'open'
        select.removeClass 'open'
        select.addClass 'closed'
        select.find('.options').slideUp 80
      else
        select.removeClass 'closed'
        select.addClass 'open'
        select.find('.options').slideDown 80

  logout: ->
    $.auth.signOut()

  doLoad: ->
    $('.loading').addClass('j-cloak')

  doneLoad: ->
    $('.loading').removeClass('j-cloak')

  authInitialization: ->
    $.ajaxSetup(
      beforeSend: (xhr, settings) ->
        # append outbound auth headers
        $.auth.appendAuthHeaders(xhr, settings)
    )
    $.auth.configure({
      apiUrl: '/api/v1'
    })
    PubSub.clearAllSubscriptions()
    PubSub.subscribe('auth', (ev, msg)->
      if ev == 'auth.validation.success'
        EpicLogger.doneLoad()
      else if ev == 'auth.validation.error'
        current_path = window.location.pathname
        console.log current_path
        if current_path not in ['/login', '/signup', '/']
          window.location.href = '/login'
      console.log ev
      console.log msg
      # console.log $.auth.user
    )
    # $('.user').render $.auth.user

  initMain: ->
    $(document).ready ->
      EpicLogger.menuResize()
      EpicLogger.sidebarToggle()
      EpicLogger.authInitialization()
      return
    return

)(jQuery)

EpicLogger.initMain()
