{ exec, spawn } = require 'child_process'

beautifyCommand = (command) ->
  '\n> ' + command

BUILD_DESCRIPTION = 'Build project from src/*.coffee to lib/*js'
BUILD_COMMAND = 'coffee --compile --output lib/ src/'

task 'build', BUILD_DESCRIPTION, ->
  console.log BUILD_DESCRIPTION
  console.log beautifyCommand BUILD_COMMAND
  exec BUILD_COMMAND, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

TEST_DESCRIPTION = 'Run test files on /tests folder'
TEST_COMMAND = 'jest'

task 'test', TEST_DESCRIPTION, ->
  console.log TEST_DESCRIPTION
  console.log beautifyCommand TEST_COMMAND
  spawn TEST_COMMAND, stdio: 'inherit', (err, stdout, stderr) ->
    throw err if err
