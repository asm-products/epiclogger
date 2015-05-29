$('.signin-github').on('click', ()->
  $.auth.oAuthSignIn({provider: 'github'})
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
    ).fail ((resp) ->
      console.log "we failed"
      console.log resp
    )

)

