{ exec, spawn } = require 'child_process'

BUILD_STRING = 'Build project from src/*.coffee to lib/*js'
BUILD_COMMAND = 'coffee --compile --output lib/ src/'

task 'build', BUILD_STRING, ->
  console.log BUILD_STRING
  console.log '\n> ' + BUILD_COMMAND
  exec BUILD_COMMAND, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

TEST_STRING = 'Run test files on /tests folder'
TEST_COMMAND = 'jest'

task 'test', TEST_STRING, ->
  console.log TEST_STRING
  console.log '\n> ' + TEST_COMMAND
  spawn TEST_COMMAND, stdio: 'inherit', (err, stdout, stderr) ->
    throw err if err
