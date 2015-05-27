$ ->
  console.log "users loaded"
  directive = {
    
  }
  PubSub.subscribe('assigned.website', (ev, website)->
    console.log 'getting users'
    $.getJSON('/api/v1/users', {website_id: website.id}, (data)->
      $('#userscontainer').render data, directive
    )
  )
