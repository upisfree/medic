# argv = require('minimist')(process.argv.slice(2))
# nightmare = require './nightmare.js'
# auth = require './auth.js'
# list = require './list.js'
# reset = require './reset.js'

# switch argv._[0]
#   when 'list'
#     list ->
#       nightmare.end().then ->
#         console.log 'End callback.'
#   when 'reset'
#     reset ->
#       console.log 'Yeah, fresh start!'
#   else
#     nightmare.end().then ->
#       console.log 'Unknown command! Use help command to solve this.'

ooo = require './ooo.js'

ooo.start()