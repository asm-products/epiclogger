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

  authInitialization: ->
    $.auth.configure({
      apiUrl: '/api/v1'
    })
    PubSub.clearAllSubscriptions()
    PubSub.subscribe('auth', (ev, msg)->
      if ev == 'auth.validation.success'
        console.log "success boss good"
      else if ev == 'auth.validation.error'
        # current_path = window.location.href
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
