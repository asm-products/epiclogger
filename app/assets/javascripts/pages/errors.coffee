$ ->
  directive = {
    errors:{
      warning: {
        href: (params) ->
          params.value + "/" + this.id
      }
    }
  }
  PubSub.subscribe('auth.validation.success', (ev, msg)->
    $.getJSON('/api/v1/errors', {website_id: 1}, (data)->
      $('#errorscontainer').render data, directive
    )
  )
