window.EpicLogger = (->
  pickedWebsite = undefined
  memberWebsites = undefined

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

  pickWebsite: (el)->
    website_id = parseInt $(el).data('id')
    for website in memberWebsites
      if website.id==website_id
        pickedWebsite = website
        PubSub.publishSync('assigned.website', pickedWebsite)
        false

  setMemberDetails: ->
    $.getJSON('/api/v1/websites', (data)->
      pickedWebsite = data.websites[0]
      memberWebsites = data.websites
      PubSub.publish('assigned.website', pickedWebsite)
      PubSub.publish('details.websites', data );

      $('.picked-website').render pickedWebsite

      directive = {
        title: {
          'data-id': ()->
            this.id
        }
      }
      $('#websites-sidebar').render data.websites, directive
    )

  renderMember: ->
    userDirectives = {
      name: {
        html: ->
          "Hello, #{this.name}"
      }
    }
    $('.user-sidebar').render $.auth.user, userDirectives

  isPage: (page)->
    current_path = window.location.pathname
    return true if current_path == "/#{page}"
    return false

  authInitialization: ->
    $.ajaxSetup(
      beforeSend: (xhr, settings) ->
        # append outbound auth headers
        $.auth.appendAuthHeaders(xhr, settings)
    )
    $.auth.configure({
      apiUrl: '/api/v1'
    })
    PubSub.subscribe('auth', (ev, msg)->
      if ev == 'auth.validation.success'
        EpicLogger.doneLoad()
        EpicLogger.setMemberDetails()
        EpicLogger.renderMember()
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
      PubSub.clearAllSubscriptions()

      EpicLogger.menuResize()
      EpicLogger.sidebarToggle()
      EpicLogger.authInitialization()

      return
    return

)(jQuery)

EpicLogger.initMain()
