fs = require 'fs'
auth = require './auth'
createSubmission = require './update/createSubmission'
deleteSubmission = require './update/deleteSubmission'
setPrice = require './update/setPrice'
setDescription = require './update/setDescription'
uploadPackage = require './update/uploadPackage'

currents = 
  appId: '9NBLGGH0FD6T'
  submissionId: '1152921504625180076'

update = (jsonPath, callback) ->
  json = JSON.parse fs.readFileSync jsonPath

  auth ->
    createSubmission json.appId, (appId, submissionId) ->
      console.log appId, submissionId
      # uploadPackage appId, submissionId, json.package, ->
      #   console.log 'App updated!'

    # setPrice currents.appId, currents.submissionId, json.price, ->
    #   setDescription currents.appId, currents.submissionId, json.description, ->

# export
module.exports = update