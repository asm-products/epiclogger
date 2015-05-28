console.log "members loaded"
form_signup = $('#signup')
form_signup.submit((e)->
  e.preventDefault()

  $.auth.emailSignUp(
    name: form_signup.find('#name').val()
    email: form_signup.find('#email').val()
    password: form_signup.find('#password').val()
    password_confirmation: form_signup.find('#passwod_confirm').val()
  ).then((resp) ->
    console.log "we have success"
    console.log resp
    window.location.href = '/errors'
  ).fail ((resp) ->
    EpicLogger.addAlert(resp.data.errors.full_messages)
    console.log "we failed"
    console.log resp
  )
)

