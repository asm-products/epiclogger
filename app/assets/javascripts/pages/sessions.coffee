$ ->
  PubSub.subscribe('auth', ()->
    console.log $.auth.user
  )
  form_login = $('#login')
  form_login.submit((e)->
    e.preventDefault()

    $.auth.emailSignIn(
      email: $('#email').val()
      password: $('#password').val()).then(
      (resp) ->
        console.log "we have success"
        console.log resp
        window.location.href = '/errors'
      ).fail ((resp) ->
        console.log "we failed"
        console.log resp
      )

  )

$(document).ready ->
  $('.user').render $.auth.user