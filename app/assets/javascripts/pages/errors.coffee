$ ->
  directive = {
    errors:{
      warning: {
        href: (params) ->
          Routes.error_path(this.id)
      }
      occurrences:
        html: () ->
          "#{this.occurrences} occurrences"
      users_count:
        html: ()->
          "#{this.users_count} users subscribed"
      last_occurrence:
        html: ()->
          moment(this.last_occurrence).calendar()
    }
  }
  PubSub.subscribe('auth.validation.success', (ev, msg)->
    $.getJSON('/api/v1/errors', {website_id: 1}, (data)->
      $('#errorscontainer').render data, directive
    )
  )
