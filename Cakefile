{ exec } = require 'child_process'

BUILD_STRING = 'Build project from src/*.coffee to lib/*js'
BUILD_COMMAND = 'coffee --compile --output lib/ src/'

task 'build', BUILD_STRING, ->
  console.log BUILD_STRING
  console.log '\n> ' + BUILD_COMMAND
  exec BUILD_COMMAND, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
