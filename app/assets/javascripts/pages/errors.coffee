$ ->
  directive = {
    errors:{
      warning: {
        href: (params) ->
          Routes.error_path(this.id)
      }
    }
  }
  PubSub.subscribe('auth.validation.success', (ev, msg)->
    $.getJSON('/api/v1/errors', {website_id: 1}, (data)->
      $('#errorscontainer').render data, directive
    )
  )
