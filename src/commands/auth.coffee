prompt = require 'prompt'
config = require '../config'
cache = require '../utils/cache'
nightmare = require '../utils/nightmare'

first = (email, password, callback) ->
  nightmare
    .goto 'https://dev.windows.com'
    .click '.msame_TxtTrunc'
    .wait '.login_cred_field_container'
    .type 'input[type="email"]', email
    .click 'input[type="password"]'
    .wait '#rightTD'
    .type 'input[type="email"]', email # click on user, redirect to dev.microsoft.com
    .type 'input[type="password"]', password
    .click 'input[type="checkbox"]'
    .click '#idSIButton9'
    .wait '#dashboard'
    .then ->
      cache.set 'isAuth', true
      cache.set 'email', email

      callback()

usual = (email, callback) ->
  nightmare
    .goto 'https://dev.windows.com'
    .click '.msame_TxtTrunc'
    .wait '.login_cred_field_container'
    .click '.use_another_account'
    .type 'input[type="email"]', email
    .click 'input[type="password"]'
    .wait '#dashboard'
    .then ->
      callback()

auth = (callback) ->
  if not cache.get 'isAuth'
    schema =
      properties:
        email:
          required: true
        password:
          required: true
          hidden: true

    prompt.message = ''
    prompt.colors = false
    prompt.start()

    prompt.get schema, (err, result) ->
      first result.email, result.password, callback
  else
    usual cache.get('email'), callback

# export
module.exports = auth